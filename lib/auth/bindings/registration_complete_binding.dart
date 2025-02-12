import 'package:get/get.dart';

import '../controllers/registration_complete_controller.dart';

class RegistrationCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationCompleteController>(() => RegistrationCompleteController());
  }
}
