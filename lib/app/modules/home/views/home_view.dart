import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/article_list_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'New York\nTimes',
          style: TextStyle(fontSize: 30, height: .9),
        ),
      ),
      body: Obx(() {
        if (!controller.isConnected.value) {
          final cachedArticles = controller.getCachedArticles();

          if (cachedArticles.isEmpty) {
            return const Center(
              child:
                  Text('No internet connection. No cached articles available.'),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () => controller.checkConnectivity(),
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: cachedArticles.length,
                itemBuilder: (context, index) {
                  final article = cachedArticles[index];
                  return ArticleListView(
                    isBusiness: true,
                    isLoading: false,
                    articles: [article],
                    itemCount: 1,
                    errorMessage: '',
                  );
                },
              ),
            );
          }
        } else {
          return RefreshIndicator(
            onRefresh: () => controller.checkConnectivity(),
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                ArticleListView(
                  isBusiness: true,
                  isLoading: controller.isLoading.value,
                  articles: controller.businessList,
                  itemCount: controller.businessList.isEmpty ? 0 : 5,
                  errorMessage: controller.errorMessage.value,
                ),
                ArticleListView(
                  isLoading: controller.isTechLoading.value,
                  articles: controller.techList,
                  itemCount: controller.techList.isEmpty ? 0 : 5,
                  errorMessage: controller.errorTechMessage.value,
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
