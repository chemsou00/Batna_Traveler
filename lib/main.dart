import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/initial_Bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
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
      initialBinding: InitialBindings(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

