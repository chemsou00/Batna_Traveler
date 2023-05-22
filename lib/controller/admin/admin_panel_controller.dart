


import 'dart:convert';

import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/config/routes/routs.dart';
import 'package:batna_traveler/core/data/remote/category.dart';
import 'package:batna_traveler/view/admin/show_all_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../../view/admin/admin_panel_home.dart';
class AdminPanelController extends GetxController{
  CategoryReadData categoryReadData = CategoryReadData(Get.find());
  goToShowData(int index){
    Get.to(()=>const ShowAllData(), arguments: {
      "title": category[index],
      "index": index,
    });

  }
  gotoEventConfig(){
    Get.toNamed(AppRouts.addNewData);
  }


  getAllCategories() async {
    Uri url = Uri.parse(AppLink.categoryRead);
    try {
      var response = await http.get(url);
      if(response.statusCode == 200){
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }else {
        throw Exception('Request failed with status: ${response.statusCode}');}
    }catch (e){
      throw Exception('Error: $e');
    }

  }



}