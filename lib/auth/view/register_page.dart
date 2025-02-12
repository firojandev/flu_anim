import 'package:flu_anim/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../common/app_constants.dart';
import '../../common/utils/my_colors.dart';
import '../../common/utils/my_text_style.dart';
import '../../common/widgets/custom_appbar.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: newAccount,
      ),
      body: SingleChildScrollView(
        child: Container(
         // height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: MyColors.backgroundLight, // Your background color
          ),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: sdHeight),
              Image.asset(openAccount),
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
                        detailsInfo,
                        style: MyTextStyle.textStyle,
                      ),
                      SizedBox(height: sdTopHeight),
                      _buildTextField(context,
                          controller.retailerIdController, retailerId),
                      SizedBox(height: sdHeight),
                      _buildTextField(context,
                          controller.mobileNumberController, mobileNumber),
                      SizedBox(height: sdHeight),
                      _buildTextField(context, controller.pinController, pin),
                      SizedBox(height: sdHeight),
                      _buildTextField(
                          context, controller.rePinController, repin),
                      SizedBox(height: sdHeight),
                      ElevatedButton(
                        onPressed: () async {
                          bool success = await controller.validateAndNext();
                          if (success) {
                            Get.offNamed(AppRoutes.otpPage);
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
                          next,
                          style: TextStyle(color: MyColors.whiteColor),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Text(
                          login,
                          style: MyTextStyle.textLinkStyle,
                        ),
                      ),
                      const SizedBox(height: 10.0),
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
