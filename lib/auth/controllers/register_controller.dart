import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var mobileNumber = "".obs;
  var retailerId = "".obs;
  var pin = "".obs;
  var rePin = "".obs;

  late TextEditingController mobileNumberController;
  late TextEditingController retailerIdController;
  late TextEditingController pinController;
  late TextEditingController rePinController;

  @override
  void onInit() {
    super.onInit();
    mobileNumberController = TextEditingController();
    retailerIdController = TextEditingController();
    pinController = TextEditingController();
    rePinController = TextEditingController();
  }

  Future<bool> validateAndNext() async {
    mobileNumber.value = mobileNumberController.text;
    pin.value = pinController.text;

    print("mobileNumber:${mobileNumber},pin:${pin}");

    // if (mobileNumber.value.isEmpty || pin.value.isEmpty) {
    //   return false;
    // }

    //Need to call network API

    return true;
  }

  @override
  void onClose() {
    super.onClose();
    mobileNumberController.dispose();
    retailerIdController.dispose();
    pinController.dispose();
    rePinController.dispose();
  }
}
