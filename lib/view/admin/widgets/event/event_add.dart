
import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../controller/admin/event_controller.dart';
import 'event_date_picker.dart';





class AddEvent extends StatelessWidget {
  const AddEvent({
    super.key,
    required this.controller,
  });

  final EventConfigController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}