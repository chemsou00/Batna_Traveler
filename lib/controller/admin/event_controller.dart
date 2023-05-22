import 'package:batna_traveler/core/data/remote/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../config/routes/routs.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handling_data_controller.dart';
import '../loading&message.dart';
import '../show_data_controller.dart';

class EventConfigController extends GetxController {
  String dateStart = DateFormat("yyy-MM-dd").format(DateTime.now());
  String dateEnd = DateFormat("yyy-MM-dd").format(DateTime.now());
  late TextEditingController titleController;

  late TextEditingController contentController;

  late TextEditingController priceController;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late StatusRequest statusRequest;
  LoadingMessage loadingMessage = LoadingMessage();
  EventData eventData = EventData(Get.find());
  ShowDataController controller = Get.find();
  EventDeleteData eventDeleteData = EventDeleteData(Get.find());

  @override
  void onInit() {
    titleController = TextEditingController();
    contentController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }

  onSubmition() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      loadingMessage.showLoading();
      //print(statusRequest);
      var response = await eventData.postData(
        titleController.text,
        contentController.text,
        dateStart,
        dateEnd,
        priceController.text,
      );
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.back();
          loadingMessage.showError(
              'Success Data Has Been Created', Icons.add);
        } else if (response['status'] == "failure") {
          Get.back();
          loadingMessage.showError(
              'User Email or Phone are Exist', Icons.error_outline);
        }
      } else if (StatusRequest.offlineFailure == statusRequest) {
        Get.back();
        loadingMessage.showError('You are Offline', Icons.wifi_off);
      } else if (StatusRequest.serverFailure == statusRequest) {
        Get.back();
        loadingMessage.showError(
            'Failed to connect with the server', Icons.error_outline);
      } else if (StatusRequest.serverException == statusRequest) {
        Get.back();
        loadingMessage.showError(
            'Failed to connect with the server', Icons.error_outline);
      }
    }
  }
  clearFields(){
    titleController.clear();
    contentController.clear();
    priceController.clear();
  }
  deleteEvent(int id) async {
    statusRequest = StatusRequest.loading;
    loadingMessage.showLoading();
    var response = await eventDeleteData.postData(id.toString());
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
        loadingMessage.showError('Success Data Has Been deleted', Icons.add);
      } else if (response['status'] == "failure") {
        Get.back();
        loadingMessage.showError(
            'Error data not deleted', Icons.error_outline);
      }
    } else if (StatusRequest.offlineFailure == statusRequest) {
      Get.back();
      loadingMessage.showError('You are Offline', Icons.wifi_off);
    } else if (StatusRequest.serverFailure == statusRequest) {
      Get.back();
      loadingMessage.showError(
          'Failed to connect with the server', Icons.error_outline);
    } else if (StatusRequest.serverException == statusRequest) {
      Get.back();
      loadingMessage.showError(
          'Failed to connect with the server', Icons.error_outline);
    }
  }
  showDeleteAlert(int id, String title,) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: const Text('ALERT 🗑'),
        content: Text("do you want to delete : $title\nwith id : $id"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("cancel"),
          ),
          MaterialButton(
            color: Colors.red,
            onPressed: () async {
              Get.back();
              //code for delete the hotel
              await deleteEvent(id);
              print(id);
              controller.update();
            },
            child: const Text("delete"),
          ),
        ],
      ),
    );
  }
  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
