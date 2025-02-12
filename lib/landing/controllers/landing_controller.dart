import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class LandingController extends GetxController with GetTickerProviderStateMixin{
  late AnimationController _imageAnimationController;
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

    // Fade in effect
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _imageAnimationController, curve: Curves.easeIn),
    )..addListener(() {
      opacityValue.value = _fadeAnimation.value;
    });

    _imageAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //ToDo
      }
    });

    // Start the animation once
    _imageAnimationController.forward();
  }

  @override
  void onClose() {
    _imageAnimationController.dispose();
    super.onClose();
  }

}