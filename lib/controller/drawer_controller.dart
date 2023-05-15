



import 'package:batna_traveler/config/routes/routs.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class CustomDrawerController extends GetxController{
  MyServices myServices = Get.find();
   String? email ;
   String? username ;
   String? role ;
   late bool isAdmin ;
   goToAdminPanel(){
     Get.toNamed(AppRouts.adminPanel);
   }
  logout(){
    Get.offAllNamed(AppRouts.signInScreen);
    myServices.sharedPreferences.clear();
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