
import 'package:batna_traveler/core/functions/valid_input.dart';
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
    return SingleChildScrollView(
      child: Form(
        key: controller.formState,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Title",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return validInputAdmin(val!, 40, 5, "title");
                },
                controller: controller.titleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: AppColors.kSecandaryColor)),
                    hintText: "Enter title",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.cyan))),
              ),
              const Text(
                "Description :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return validInputAdmin(val!, 500, 5, "content");
                },
                controller: controller.contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 2, color: AppColors.kSecandaryColor),
                    ),
                    hintText: "Enter Description",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.cyan))),
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
              const SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (val) {
                  return validInputAdmin(val!, 5, 1 , "price");
                },
                controller: controller.priceController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: AppColors.kSecandaryColor)),
                    hintText: "price",
                    icon: Icon(Icons.monetization_on_outlined),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.cyan))),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 60,),
              SizedBox(height: 50,width: 100,
                child: ElevatedButton(onPressed: (){
                  controller.onSubmition();
                }, child: const Text('Submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}