
import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.title, this.onPressed}) : super(key: key);
  final String title ;
  final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.kPrimaryColor,
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ));
  }
}

