import 'package:batna_traveler/controller/admin/event_controller.dart';
import 'package:batna_traveler/view/admin/widgets/hotel/hotel_add.dart';
import 'package:batna_traveler/view/admin/widgets/restaurant/restaurant_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/event/event_add.dart';

class AddNewData extends StatelessWidget {
  const AddNewData({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var title = Get.arguments["title"];
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text("$title Add")),
      body: widgetData(title),
    );
  }
}

Widget widgetData (String title){
  if(title == "Events"){
    Get.put(EventConfigController());
    return AddEvent(controller: Get.find());
  }else if(title == "Hotel"){
    return const AddHotel();
  }else if(title == "Restaurant"){
    return const AddRestaurant();
  }
  return const SizedBox();
}




