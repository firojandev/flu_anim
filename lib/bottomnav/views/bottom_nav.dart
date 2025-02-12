import 'package:flu_anim/bottomnav/controllers/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/app_constants.dart';
import '../../common/utils/my_colors.dart';
import '../../home/views/home_page.dart';
import '../../menu/views/menu_page.dart';

class BottomNav extends GetView<BottomNavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            HomePage(),
            MenuPage(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeTab,
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: home),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: menu),
        ],
      )),
    );
  }
}
