
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes/routs.dart';
import '../services/services.dart';


class MyMiddleware extends GetMiddleware{
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;
  @override
    RouteSettings? redirect(String? route){
    if(myServices.sharedPreferences.getBool("login") == true){
      return  const RouteSettings(name: AppRouts.homeScreen);
    }
    return null;
  }
}