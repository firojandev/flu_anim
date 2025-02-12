import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flu_anim/verification/controller/otp_controller.dart';

import '../../app_routes.dart';
import '../../common/app_constants.dart';
import '../../common/utils/my_colors.dart';
import '../../common/utils/my_text_style.dart';
import '../../common/widgets/custom_appbar.dart';

class OtpPage extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: verification,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: MyColors.backgroundLight, // Your background color
          ),
          child: Column(
            children: [
              SizedBox(height: sdHeight),
              Image.asset(verifiedAccount),
              //Icon(Icons.done, size: 32, color: MyColors.primaryColor),
              SizedBox(height: sdHeight),
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
                        oTPTitle,
                        style: MyTextStyle.titleStyle,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        oTPDetails,
                        style: MyTextStyle.textStyle,
                      ),
                      SizedBox(height: sdTopHeight),
                      _buildTextField(context,
                          controller.mobileNumberController, verificationCode),
                      SizedBox(height: sdHeight),
                      ElevatedButton(
                        onPressed: () async {
                          bool success = await controller.validateAndVerify();
                          if (success) {
                           // Get.offNamed(AppRoutes.pinPage);
                            Get.offNamed(AppRoutes.regCompletePage);
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