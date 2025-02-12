import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flu_anim/verification/controller/pin_controller.dart';

import '../../common/app_constants.dart';
import '../../common/utils/my_colors.dart';
import '../../common/utils/my_text_style.dart';
import '../../common/widgets/custom_appbar.dart';

class PinPage extends GetView<PinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: setPin,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: MyColors.backgroundLight, // Your background color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: MyColors.whiteColor,
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: padding1),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        msgPin,
                        style: MyTextStyle.titleStyle,
                      ),
                      SizedBox(height: sdTopHeight),
                      _buildTextField(context,
                          controller.mobileNumberController, pin),
                      SizedBox(height: sdHeight),
                      ElevatedButton(
                        onPressed: () async {
                          bool success = await controller.validateAndVerify();
                          if (success) {
                            Get.back();
                          } else {
                            Get.defaultDialog(
                              title: msgRegistrationFailed,
                              middleText: msgIncorrectInformation,
                              textConfirm: okay,
                              onConfirm: () => Get.back(),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              MyColors.primaryColor),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(double.infinity, 48)),
                        ),
                        child: Text(
                          verifyNow,
                          style: TextStyle(color: MyColors.whiteColor),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // GestureDetector(
                      //   onTap: (){
                      //     Get.back();
                      //   },
                      //   child: Text(
                      //     login,
                      //     style: MyTextStyle.textLinkStyle,
                      //   ),
                      // ),
                      // const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //common Text Field
  _buildTextField(
      BuildContext context, TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: MyColors.primaryColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: MyColors.primaryColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}