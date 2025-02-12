import 'package:get/get.dart';
import 'package:flu_anim/auth/bindings/LoginBinding.dart';
import 'package:flu_anim/auth/bindings/RegisterBinding.dart';
import 'package:flu_anim/auth/bindings/registration_complete_binding.dart';
import 'package:flu_anim/auth/view/login_page.dart';
import 'package:flu_anim/auth/view/register_page.dart';
import 'package:flu_anim/auth/view/registration_complete_page.dart';
import 'package:flu_anim/bottomnav/bindings/bottom_nav_binding.dart';
import 'package:flu_anim/bottomnav/views/bottom_nav.dart';
import 'package:flu_anim/home/bindings/home_binding.dart';
import 'package:flu_anim/home/views/home_page.dart';
import 'package:flu_anim/splash/splash_binding.dart';
import 'package:flu_anim/splash/splash_page.dart';
import 'package:flu_anim/verification/bindings/otp_binding.dart';
import 'package:flu_anim/verification/bindings/pin_binding.dart';
import 'package:flu_anim/verification/view/otp_page.dart';
import 'package:flu_anim/verification/view/pin_page.dart';

class AppRoutes {
  static const String splashPage = '/splash_page';
  static const String logInPage = '/login_page';
  static const String registerPage = '/register_page';
  static const String otpPage = '/otp_page';
  static const String regCompletePage = '/reg_complete_page';
  static const String pinPage = '/pin_page';
  static const String homePage = '/home_page';
  static const String bottomNav = '/bottom_nav';

  static List<GetPage> pages = [
    GetPage(name: splashPage, page: () => SplashPage(), bindings: [SplashBinding()]),
    GetPage(name: logInPage, page: () => LoginPage(), bindings: [LoginBinding()]),
    GetPage(name: registerPage, page: () => RegisterPage(), bindings: [RegisterBinding()]),
    GetPage(name: otpPage, page: () => OtpPage(), bindings: [OtpBinding()]),
    GetPage(name: regCompletePage, page: () => RegistrationCompletePage(), bindings: [RegistrationCompleteBinding()]),
    GetPage(name: pinPage, page: () => PinPage(), bindings: [PinBinding()]),
    GetPage(name: bottomNav, page: () => BottomNav(), bindings: [BottomNavBinding()]),
    GetPage(name: homePage, page: () => HomePage(), bindings: [HomeBinding()]),
  ];
}
