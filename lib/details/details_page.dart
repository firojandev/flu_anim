import 'package:flu_anim/common/app_constants.dart';
import 'package:flu_anim/common/utils/my_colors.dart';
import 'package:flu_anim/common/utils/my_text_style.dart';
import 'package:flu_anim/details/details_controller.dart';
import 'package:flu_anim/landing/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class DetailsPage extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Opacity(
                          opacity: controller.opacityValue.value,
                          child: Image(image: AssetImage(ivSuccess)))),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Obx(
                          () => Opacity(
                            opacity: controller.opacityValue.value,
                            child: Text(
                              dummyTxt,
                              style: MyTextStyle.titleStyleWhite16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
