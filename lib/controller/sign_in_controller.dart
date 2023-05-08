import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureText = true;

  signIn() async {
    if (formState.currentState!.validate()) {

    }
  }

  goToRegistration() {}
}
