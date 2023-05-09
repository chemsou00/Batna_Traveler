import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/controller/sign_up_controller.dart';
import 'package:batna_traveler/view/components/common_widgets.dart';
import 'package:batna_traveler/view/components/decoration.dart';
import 'package:batna_traveler/view/components/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/valid_input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
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
              "Hello,\nWelcome",
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
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 25,
                        color: AppColors.kSecandaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.userNameController,
                    validator: (val) {
                      return validInput(val!, 40, 7, "username");
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: textFieldDecoration.copyWith(
                        hintText: "Your Name",
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    validator: (val) {
                      return validInput(val!, 40, 7, "email");
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: textFieldDecoration.copyWith(
                        hintText: "email", prefixIcon: const Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    maxLength: 10,
                    controller: controller.phoneController,
                    validator: (val) {
                      return validInput(val!, 40, 7, "phone");
                    },
                    keyboardType: TextInputType.phone,
                    decoration: textFieldDecoration.copyWith(
                        hintText: "phone Number",
                        prefixIcon: const Icon(Icons.phone)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    validator: (val) {
                      return validInput(val!, 20, 8, "password");
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: textFieldDecoration.copyWith(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                          icon: controller.obscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            controller.obscure();
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    title: 'Sign In',
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offNamed(AppRouts.signInScreen);
                      },
                      child: const Text(
                        "I have an account !",
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
