import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../common/app_constants.dart';
import '../../common/utils/my_colors.dart';
import '../../common/utils/my_text_style.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Center(
          child: Text(
            appName,
            style: MyTextStyle.titleStyleWhite,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: MyColors.backgroundLight, // Your background color
          ),
          child: Center(
            child: Obx(() => AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: controller.isCardVisible.value ? Alignment.center : Alignment.bottomCenter,
              // Ensure the parent container takes the full height
             // height: MediaQuery.of(context).size.height,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: controller.isCardVisible.value ? 1.0 : 0.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 148,
                      width: 148,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(logo), // ✅ Correct
                          fit: BoxFit.cover, // Adjust as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      color: MyColors.whiteColor,
                      elevation: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              loginToYourAccount,
                              style: MyTextStyle.textStyle,
                            ),
                            const SizedBox(height: 30.0),
                            TextField(
                              controller: controller.mobileNumberController,
                              onChanged: (value) => mobileNumber = value,
                              decoration: InputDecoration(
                                labelText: mobileNumber,
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
                            ),
                            const SizedBox(height: 16.0),
                            TextField(
                              controller: controller.pinController,
                              decoration: InputDecoration(
                                labelText: pin,
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
                              obscureText: true,
                            ),
                            const SizedBox(height: 6.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(() => Checkbox(
                                  tristate: false,
                                  value: controller.rememberMe.value,
                                  onChanged: (bool? value) {
                                    controller.toggleRememberMe(value ?? false);
                                  },
                                )),
                                Text(rememberMe),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async {
                                bool success = await controller.validateAndLogin();
                                if (success) {
                                  Get.offNamed(AppRoutes.bottomNav);
                                } else {
                                  Get.defaultDialog(
                                    title: msgLoginFailed,
                                    middleText: msgIncorrectMobileOrPin,
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
                                login,
                                style: TextStyle(color: MyColors.whiteColor),
                              ),
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.registerPage);
                              },
                              child: Text(
                                register,
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
            )),
          ),
        ),
      ),
    );
  }
}
