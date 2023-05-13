import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/controller/sign_in_controller.dart';
import 'package:batna_traveler/view/components/common_widgets.dart';
import 'package:batna_traveler/view/components/decoration.dart';
import 'package:batna_traveler/view/components/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/valid_input.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignInController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formState,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const LogoApp(),
            const Text(
              "Welcome\nBack",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kSecandaryColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 25,
                        color: AppColors.kSecandaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Get.size.height * 0.09,
                  ),
                  TextFormField(
                    // autofocus: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.emailController,
                    validator: (val) {
                      return validInput(val!, 40, 7, "email");
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: textFieldDecoration.copyWith(
                        hintText: "email", prefixIcon: const Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: controller.passwordController,
                    validator: (val) {
                      return validInput(val!, 20, 8, "password");
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: textFieldDecoration.copyWith(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: const Icon(Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    title: 'Sign In',
                    onPressed: () {
                      controller.signIn();
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offNamed(AppRouts.signUpScreen);
                      },
                      child: const Text(
                        "I d ont have an account !",
                        style: TextStyle(color: AppColors.kOrangeColor),
                      )),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
