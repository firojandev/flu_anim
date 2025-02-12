import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flu_anim/app_routes.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController _imageAnimationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  RxDouble scaleValue = 0.3.obs;
  RxDouble opacityValue = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    _initAnimation();
  }

  _initAnimation() {
    // Image animation that comes from depth
    _imageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust as needed
    );

    // Scale from small to normal (depth effect)
    _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
          parent: _imageAnimationController, curve: Curves.bounceIn),
    )..addListener(() {
        scaleValue.value = _scaleAnimation.value;
      });

    // Fade in effect
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _imageAnimationController, curve: Curves.easeIn),
    )..addListener(() {
        opacityValue.value = _fadeAnimation.value;
      });

    _imageAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextPage();
      }
    });

    // Start the animation once
    _imageAnimationController.forward();
  }

  void _navigateToNextPage() {
    bool isLogin = false; // Retrieve from shared preferences
    if (!isLogin) {
      //Get.offNamed(AppRoutes.logInPage); // Navigate to login page
      Get.offNamed(AppRoutes.landingPage); // Navigate to login page
    } else {
      Get.offNamed(AppRoutes.homePage); // Navigate to home page
    }
  }

  @override
  void onClose() {
    _imageAnimationController.dispose();
    super.onClose();
  }
}
