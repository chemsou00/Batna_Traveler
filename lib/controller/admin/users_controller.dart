



import 'package:batna_traveler/core/class/status_request.dart';
import 'package:batna_traveler/core/data/remote/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data_controller.dart';
import '../loading&message.dart';
import '../show_data_controller.dart';
class UsersController extends GetxController {
  late StatusRequest statusRequest;
  LoadingMessage loadingMessage = LoadingMessage();
  UserDeleteData userDeleteData = UserDeleteData(Get.find());
  ShowDataController controller = Get.find();


  deleteRestaurant(int id) async {
    statusRequest = StatusRequest.loading;
    loadingMessage.showLoading();
    var response = await userDeleteData.postData(id.toString());
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
              await deleteRestaurant(id);
              print(id);
              controller.update();
            },
            child: const Text("delete"),
          ),
        ],
      ),
    );
  }

}