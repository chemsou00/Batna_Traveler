import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SpacerBetween extends StatelessWidget {
  const SpacerBetween({Key? key, required this.title, this.onTap}) : super(key: key);
  final String title ;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        GestureDetector(
          onTap: onTap,
            child: const Text(
          "See all...",
          style: TextStyle(color: AppColors.kOrangeColor),
        )),
      ]),
    );
  }
}
