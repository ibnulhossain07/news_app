import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/app/data/theme/dark_theme.dart';
import 'package:news_app/app/data/theme/light_theme.dart';
import 'package:news_app/app/data/theme/theme_controller.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: lightMode(context),
      darkTheme: darkMode(context),
      themeMode:
          ThemeController().isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
