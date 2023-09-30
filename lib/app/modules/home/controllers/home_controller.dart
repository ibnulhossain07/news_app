import 'package:get/get.dart';
import 'package:news_app/app/modules/discovery/controllers/discovery_controller.dart';
import 'package:news_app/app/modules/discovery/views/discovery_view.dart';
import 'package:news_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:news_app/app/modules/home_screen/views/home_screen_view.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final page = [
    const HomeScreenView(),
    const DiscoveryView(),
  ];

  @override
  void onInit() {
    Get.put(HomeScreenController());
    Get.put(DiscoveryController());
    super.onInit();
  }
}
