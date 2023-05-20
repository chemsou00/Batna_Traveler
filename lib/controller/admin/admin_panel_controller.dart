


import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/view/admin/show_all_data.dart';
import 'package:get/get.dart';

import '../../view/admin/admin_panel_home.dart';
class AdminPanelController extends GetxController{

  goToShowData(int index){
    Get.to(()=>const ShowAllData(), arguments: {
      "title": category[index],
      "index": index,
    });

  }
  gotoEventConfig(){
    Get.toNamed(AppRouts.addNewData);
  }



}