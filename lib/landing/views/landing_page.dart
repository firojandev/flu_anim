import 'package:flu_anim/common/app_constants.dart';
import 'package:flu_anim/common/utils/my_colors.dart';
import 'package:flu_anim/common/utils/my_text_style.dart';
import 'package:flu_anim/landing/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<LandingController> {
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
                      Image(image: AssetImage(ivSuccess)),
                      SizedBox(width: 16,),
                      Expanded(child: Text(dummyTxt,style: MyTextStyle.titleStyleWhite16,)),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text(dummyTxt,style: MyTextStyle.titleStyleWhite16,)),
                      SizedBox(width: 16,),
                      Image(image: AssetImage(verifiedAccount)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

