


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

DateTime time = DateTime.now();

class EventConfigController extends GetxController{
  DateTime dateStartTime = DateTime(time.year,time.month,time.day);
  DateTime dateEndTime = DateTime(time.year,time.month,time.day);
  late TextEditingController titleController ;
  late TextEditingController contentController ;





  @override
  void onInit() {
    titleController = TextEditingController();
    contentController = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
