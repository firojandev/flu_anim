import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var mobileNumber = "".obs;

  late TextEditingController mobileNumberController;

  @override
  void onInit() {
    super.onInit();
    mobileNumberController = TextEditingController();
  }

  Future<bool> validateAndVerify() async {
    mobileNumber.value = mobileNumberController.text;

    // if (mobileNumber.value.isEmpty) {
    //   return false;
    // }
    return true;
  }

  @override
  void onClose() {
    super.onClose();
    mobileNumberController.dispose();
  }

}