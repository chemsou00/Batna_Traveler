import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/view/widgets/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/common_widgets.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const LogoApp(),
            Image.asset(
              "assets/images/onboarding.png",
              height: 180,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Hi There ! ",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColors.kSecandaryColor)),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 250,
              child: Text(
                "You can now browse all the trips, landmarks, and tourist attractions. What are you waiting for?\n"
                " Start now!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            CustomButton(title: "Sign Up", onPressed: () {
              Get.toNamed(AppRouts.signUpScreen);

            }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: "Sign In",
                onPressed: () {
                  Get.toNamed(AppRouts.signInScreen);
                }),
          ],
        ),
      ),
    );
  }
}
