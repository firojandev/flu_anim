import 'package:get/get.dart';
import 'package:flu_anim/verification/controller/pin_controller.dart';

import '../controller/otp_controller.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinController>(() => PinController());
  }
}
