import 'package:batna_traveler/config/routes/routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SignUpController extends GetxController {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController phoneController;

  late TextEditingController userNameController;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    userNameController = TextEditingController();
    super.onInit();
  }

  signUp() {
    Get.offNamed(AppRouts.homeScreen);
    // if(formState.currentState!.validate()){
    //
    // }
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
