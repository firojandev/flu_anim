import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var mobileNumber = "".obs;
  var pin = "".obs;
  var rememberMe = false.obs;

  var isCardVisible = false.obs;

  late TextEditingController mobileNumberController;
  late TextEditingController pinController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mobileNumberController = TextEditingController();
    pinController = TextEditingController();

    Future.delayed(const Duration(microseconds: 3000), () async {
      isCardVisible.value = true;
    });

  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  Future<bool> validateAndLogin() async {
    mobileNumber.value = mobileNumberController.text;
    pin.value = pinController.text;

    print("mobileNumber:${mobileNumber},pin:${pin},rememberMe:${rememberMe.value}");

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
    pinController.dispose();
  }
}
