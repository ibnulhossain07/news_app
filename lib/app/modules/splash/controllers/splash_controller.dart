import 'dart:async';

import 'package:get/get.dart';
import 'package:news_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  timer() async {
    Timer(const Duration(seconds: 2), () async {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onInit() {
    timer();
    super.onInit();
  }
}
