import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu_anim/common/app_constants.dart';
import 'package:flu_anim/common/utils/my_colors.dart';
import 'package:flu_anim/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              color: MyColors.primaryColor
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Obx(() => Opacity(
                    opacity: controller.opacityValue.value,
                    child: Transform.scale(
                      scale: controller.scaleValue.value,
                      child: Container(
                        height: 148,
                        width: 148,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(logo), // ✅ Correct
                            fit: BoxFit.cover, // Adjust as needed
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
