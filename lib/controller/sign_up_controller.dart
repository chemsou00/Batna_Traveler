import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/controller/loading&message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/data/remote/signup.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data_controller.dart';
import '../core/services/services.dart';

class SignUpController extends GetxController {
  MyServices myServices = Get.find();
  SignUpData signUpData = SignUpData(Get.find());

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController userNameController;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureText = true;
  late StatusRequest statusRequest;
  LoadingMessage loadingMessage = LoadingMessage();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    userNameController = TextEditingController();
    super.onInit();
  }

  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      loadingMessage.showLoading();
      // print(statusRequest);
      var response = await signUpData.postData(
        userNameController.text,
        emailController.text,
        passwordController.text,
        phoneController.text,
      );
      statusRequest = handlingData(response);
      // print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          loadingMessage.afterVerify(
            "Message",
            "Well done Your account has been created ",
            AppRouts.homeScreen,
            {
              "email": emailController.text,
              "rout": "signup",
            },
          );
        } else if (response['status'] == "failure") {
          Get.back();
          loadingMessage.showError(
              'User Email or Phone are Exist', Icons.error_outline);
        }
      } else if (StatusRequest.offlineFailure == statusRequest) {
        Get.back();
        loadingMessage.showError('You are Offline', Icons.wifi_off);
      } else if (StatusRequest.serverFailure == statusRequest) {
        Get.back();
        loadingMessage.showError(
            'Failed to connect with the server', Icons.error_outline);
      } else if (StatusRequest.serverException == statusRequest) {
        Get.back();
        loadingMessage.showError(
            'Failed to connect with the server', Icons.error_outline);
      }
    }
  }

  obscure() {
    obscureText = !obscureText;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    phoneController.dispose();

    super.dispose();
  }
}
