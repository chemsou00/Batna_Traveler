
import 'dart:convert';

import 'package:batna_traveler/core/data/remote/hotel.dart';
import 'package:batna_traveler/core/data/remote/restaurant.dart';
import 'package:get/get.dart';

import '../config/constants/api.dart';
import 'package:http/http.dart' as http;

class ShowDataController extends GetxController {
  HotelReadData hotelReadData = HotelReadData(Get.find());
  RestaurantReadData restaurantReadData = RestaurantReadData(Get.find());
  late List<dynamic> events = [];
  late List<dynamic> categories= [];
  bool loading = false;

  getData(String title) async {
    if(title == "Hotel") {
      Uri url = Uri.parse(AppLink.hotelRead);
      try {
        var response = await http.get(url).timeout(Duration(seconds: 10));
        if(response.statusCode == 200){
          //print(jsonDecode(response.body));
          return jsonDecode(response.body);
        }else {
          throw Exception('Request failed with status: ${response.statusCode}');}
      }catch (e){
        throw Exception('Error: $e');
      }
    }
    if (title == "Restaurant"){
      Uri url = Uri.parse(AppLink.restaurantRead);
      try {
        var response = await http.get(url).timeout(Duration(seconds: 10));
        if(response.statusCode == 200){
          print(jsonDecode(response.body));
          return jsonDecode(response.body);
        }else {
          throw Exception('Request failed with status: ${response.statusCode}');}
      }catch (e){
        throw Exception('Error: $e');
      }
    }
    if (title == "Events"){
      Uri url = Uri.parse(AppLink.eventRead);
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
    if(title == "Users"){
      Uri url = Uri.parse(AppLink.usersRead);
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

  getHotels()async {
    Uri url = Uri.parse(AppLink.hotelRead);
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
  getRestaurants()async {
    Uri url = Uri.parse(AppLink.restaurantRead);
    try {
      var response = await http.get(url);
      if(response.statusCode == 200){
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }else {
        throw Exception('Request failed with status: ${response.statusCode}');}
    }catch (e){
      throw Exception('Error: $e');
    }
  }

  refreshScreen()async {
  Future.delayed(Duration(seconds: 2));
  update();
  }

  @override
  void onInit() async{
    //await getData("Hotel");
    super.onInit();
  }
}