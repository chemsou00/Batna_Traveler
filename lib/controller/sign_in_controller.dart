import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/controller/loading&message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/data/remote/login.dart';
import '../core/functions/handling_data_controller.dart';
import '../core/services/services.dart';

class SignInController extends GetxController {
  MyServices myServices = Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late StatusRequest statusRequest;
  LoadingMessage loadingMessage = LoadingMessage();
  SignInData signInData = SignInData(Get.find());
  bool obscureText = true;

  @override
  onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  obscure(){
    obscureText = !obscureText ;
    update();
  }

  signIn() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      loadingMessage.showLoading();
      var response = await signInData.postData(
        emailController.text,
        passwordController.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      print(statusRequest);
      // print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          //print("This is User Id : ${response['data']['user_id']}");
          myServices.sharedPreferences.setBool("login", true);
          myServices.sharedPreferences
              .setInt("id", response['data']['user_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['user_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['user_email']);
          myServices.sharedPreferences
              .setInt("role", response['data']['user_role']);
          Get.offNamed(
            AppRouts.homeScreen,
          );
        } else if (response['status'] == "failure") {
          Get.back();
          loadingMessage.showError(
              'User Email or Password Incorrect', Icons.error_outline);
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

  goToSignUpScreen() {
    Get.toNamed(AppRouts.signUpScreen);
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
