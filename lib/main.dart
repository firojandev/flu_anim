import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu_anim/app_routes.dart';
import 'package:flu_anim/common/utils/app_theme.dart';

import 'common/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splashPage,
      getPages: AppRoutes.pages,
    );
  }
}
