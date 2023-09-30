import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/data/theme/color_manager.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: controller.page[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Explore",
            ),
          ],
          onTap: (value) {
            controller.currentIndex.value = value;
          },
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          elevation: 0,
          backgroundColor: ColorManager().turquoise,
        ),
      ),
    );
  }
}
