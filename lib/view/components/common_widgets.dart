
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 80,
          ),
        ],
      ),
    );
  }
}



