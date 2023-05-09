import 'package:batna_traveler/config/routes/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  signIn() async {

    Get.offNamed(AppRouts.homeScreen);
    // if (formState.currentState!.validate()) {
    //
    // }
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
