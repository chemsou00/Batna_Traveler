import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/controller/admin/event_config_controller.dart';
import 'package:batna_traveler/view/admin/widgets/event_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventAdd extends StatelessWidget {
  const EventAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EventConfigController());
    return SizedBox(
      height: Get.height*0.90,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("Event Add")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Title",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                // controller: textarea,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: AppColors.kSecandaryColor)),
                    hintText: "Enter title",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent))),
              ),
              const Text(
                "Description :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: AppColors.kSecandaryColor),
                    ),
                    hintText: "Enter Remarks",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Select Date :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              EventDatePicker(context: context,controller: controller,),
            ],
          ),
        ),
      ),
    );
  }
}


