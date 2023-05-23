



import 'package:batna_traveler/config/routes/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class CustomDrawerController extends GetxController{
  MyServices myServices = Get.find();
   String? email ;
   String? username ;
   String? role ;
   bool isDark = false ;
   late bool isAdmin ;
   goToAdminPanel(){
     Get.toNamed(AppRouts.adminPanel);
   }
  logout(){
    Get.offAllNamed(AppRouts.signInScreen);
    myServices.sharedPreferences.clear();
  }
  changeTheme(bool state){
     isDark = state ;
     myServices.sharedPreferences.setBool("isDark", state);
     if(isDark){
       Get.changeThemeMode(ThemeMode.dark);
     }else {
         Get.changeThemeMode(ThemeMode.light);
       }
     update();
     }


  @override
  void onInit() {
    email = myServices.sharedPreferences.getString("email");
    username = myServices.sharedPreferences.getString("username");
    role = myServices.sharedPreferences.getInt("role") == 1 ? "Admin" : "Normal";
    isAdmin = role == "Admin" ? true : false;
    super.onInit();
  }
}