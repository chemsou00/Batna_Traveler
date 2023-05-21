import 'package:batna_traveler/core/data/remote/hotel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handling_data_controller.dart';
import '../loading&message.dart';

class HotelController extends GetxController {

  HotelData hotelData = HotelData(Get.find());

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController roomsController;
  late TextEditingController rateController;

  late StatusRequest statusRequest;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoadingMessage loadingMessage = LoadingMessage();


  @override
  void onInit() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    roomsController = TextEditingController();
    rateController = TextEditingController();
    super.onInit();
  }

  onSubmition() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      loadingMessage.showLoading();
      //print(statusRequest);
      var response = await hotelData.postData(
        nameController.text,
        addressController.text,
        phoneController.text,
        roomsController.text,
        rateController.text,
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

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    roomsController.dispose();
    rateController.dispose();
    super.onClose();
  }
}
