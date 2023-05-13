import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';

class LoadingMessage {

  showLoading() {
    if(!Get.isSnackbarOpen){
      Get.dialog(
        barrierDismissible: true,
        Dialog(
          child: Row(
            children: [
              Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.all(20),
                  child: const CircularProgressIndicator.adaptive(
                    strokeWidth: 2,
                  )),
              const Text("Loading..."),
            ],
          ),
        ),
      );
  }

  }

  showError(String message, IconData icon) {
    Get.showSnackbar(
      GetSnackBar(
        showProgressIndicator: true,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.all(20),
        backgroundColor: AppColors.kSecandaryColor,
        icon: Icon(
          icon,
          color: Colors.red,
        ),
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );

  }

  messageErrors(StatusRequest statusRequest,LoadingMessage loadingMessage) {
    switch (statusRequest) {
      case StatusRequest.failure:
        {
          Get.back();
          loadingMessage.showError(
              'User Email or Phone ar Exist', Icons.error_outline);
          break;
        }
      case StatusRequest.offlineFailure:
        {
          Get.back();
          loadingMessage.showError('You are Offline', Icons.wifi_off);
          break;
        }
      case StatusRequest.serverException:
        {
          Get.back();
          loadingMessage.showError('Connection failed', Icons.error_outline);
          break;
        }
      case StatusRequest.serverFailure:
        {
          Get.back();
          loadingMessage.showError(
              'Failed to connect with the server', Icons.error_outline);
          break;
        }
      default:
        Get.back();
        loadingMessage.showError('Unknown Problem', Icons.error_outline);
    }
  }
  afterVerify(String title, String content, String rout, argument) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.offNamed(rout, arguments: argument);
            },
            child: const Text("Go"),
          )
        ],
      ),
    );
  }

}
