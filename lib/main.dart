import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/view/screens/home_screen.dart';
import 'package:batna_traveler/view/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Batna Traveler',
      getPages: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

