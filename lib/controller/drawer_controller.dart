



import 'package:batna_traveler/config/routes/routs.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController{

  logout(){
    Get.offNamed(AppRouts.signInScreen);
  }
}