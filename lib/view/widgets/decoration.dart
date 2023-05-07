import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

InputDecoration textFieldDecoration = const InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          width: 1.0,
          color: AppColors.kSecandaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.0, color: AppColors.kPrimaryColor),
      gapPadding: 5,
    ));
