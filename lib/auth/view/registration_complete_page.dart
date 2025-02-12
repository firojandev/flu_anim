import 'package:flu_anim/auth/controllers/registration_complete_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_constants.dart';
import '../../common/utils/my_colors.dart';
import '../../common/utils/my_text_style.dart';
import '../../common/widgets/custom_appbar.dart';

class RegistrationCompletePage extends GetView<RegistrationCompleteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: newAccount,
      ),
      body: SingleChildScrollView(
        child: Container(
        //  height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: MyColors.backgroundLight, // Your background color
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: sdHeight),
              Image.asset(ivSuccess),
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
                        msgCongratulations,
                        style: MyTextStyle.titleStyle,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        oTPVerificationDone,
                        style: MyTextStyle.textStyle,
                      ),
                      SizedBox(height: sdTopHeight),
                      ElevatedButton(
                        onPressed: () async {
                          Get.back();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              MyColors.primaryColor),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(double.infinity, 48)),
                        ),
                        child: Text(
                          goToLogin,
                          style: TextStyle(color: MyColors.whiteColor),
                        ),
                      ),
                      const SizedBox(height: 30),
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

}