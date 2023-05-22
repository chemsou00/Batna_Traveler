




import 'dart:convert';

import 'package:batna_traveler/core/data/remote/category.dart';
import 'package:batna_traveler/core/data/remote/event.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  EventReadData eventReadData = EventReadData(Get.find());
  CategoryReadData categoryReadData = CategoryReadData(Get.find());
  late List<dynamic> events = [];
  late List<dynamic> categories= [];
  bool loading = false;

getCategories() async {
    try{
      final response = await categoryReadData.postData();
      return response;
    }catch (e){
      print(e);
    }

  }
  getEvents() async {
    try{
      final response = await eventReadData.postData();
      return response;
    }catch (e){
      print(e);
    }
  }

  refreshHome()async {
  Future.delayed(Duration(seconds: 2));
  update();
  }

  @override
  void onInit() async {
    super.onInit();
  }
}