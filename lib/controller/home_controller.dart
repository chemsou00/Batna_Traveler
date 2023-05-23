
import 'dart:convert';

import 'package:batna_traveler/config/constants/api.dart';
import 'package:batna_traveler/core/data/remote/category.dart';
import 'package:batna_traveler/core/data/remote/event.dart';
import 'package:batna_traveler/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/class/status_request.dart';
import '../core/functions/handling_data_controller.dart';


class HomeController extends GetxController {
  MyServices myServices = Get.find();
  EventReadData eventReadData = EventReadData(Get.find());
  CategoryReadData categoryReadData = CategoryReadData(Get.find());
  late List<dynamic> events = [];
  late List<dynamic> categories= [];
  late StatusRequest statusRequest;
  bool loading = false;

  getData() async {
    statusRequest = StatusRequest.loading;
    final response = await categoryReadData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
getCategories() async {
    Uri url = Uri.parse(AppLink.categoryRead);
    try {
    var response = await http.get(url).timeout(Duration(seconds: 10));

      if(response.statusCode == 200){
        print(response);
        return jsonDecode(response.body);
      }else {
        throw Exception('Request failed with status: ${response.statusCode}');}
    }catch (e){
      throw Exception('Error: $e');
    }

  }
  getEvents() async {
    Uri url = Uri.parse(AppLink.eventRead);
    try {
      var response = await http.get(url).timeout(Duration(seconds: 10));

      if(response.statusCode == 200){
        print(response);
        return jsonDecode(response.body);
      }else {
        throw Exception('Request failed with status: ${response.statusCode}');}
    }catch (e){
      throw Exception('Error: $e');
    }
  }

  refreshScreen()async {
  await Future.delayed(Duration(seconds: 1));
  update();
  }

  ThemeMode themeMode(){
    bool isDark = myServices.sharedPreferences.getBool("isDark") ?? false;
    if(isDark){
      return ThemeMode.dark;
    }else
    return ThemeMode.light;
  }
  @override
  void onInit() async {
    themeMode();
    super.onInit();
  }
}