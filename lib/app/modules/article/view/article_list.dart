import 'package:cached_network_image/cached_network_image.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/theme/color_manager.dart';
import 'package:news_app/app/modules/article/view/article_details.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';

class ArticleList extends StatelessWidget {
  final bool isBusiness;
  const ArticleList({
    super.key,
    required this.isBusiness,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(isBusiness ? "Business News" : "Tech News"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => ListTile(
          onTap: () => ArticleDetails(
            isBusiness: isBusiness,
            title: isBusiness
                ? controller.businessList[index].title
                : controller.techList[index].title,
            description: isBusiness
                ? controller.businessList[index].description
                : controller.techList[index].description,
            imgUrl: isBusiness
                ? controller.businessList[index].urlToImage
                : controller.techList[index].urlToImage,
            publishTime: isBusiness
                ? controller.businessList[index].publishedAt.toString()
                : controller.techList[index].publishedAt.toString(),
            content: isBusiness
                ? controller.businessList[index].content
                : controller.techList[index].content,
            author: isBusiness
                ? controller.businessList[index].author
                : controller.techList[index].author,
            url: isBusiness
                ? controller.businessList[index].url
                : controller.techList[index].url,
          ),
          titleAlignment: ListTileTitleAlignment.titleHeight,
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 150,
              width: 90,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(
                Icons.warning_rounded,
                color: Colors.red,
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: isBusiness
                  ? controller.businessList[index].urlToImage
                  : controller.techList[index].urlToImage,
            ),
          ),
          title: Text(
            isBusiness
                ? controller.businessList[index].title
                : controller.techList[index].title,
          ),
          subtitle: SeparatedColumn(
            padding: const EdgeInsets.only(top: 10),
            separatorBuilder: () => const SizedBox(height: 10),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isBusiness
                    ? controller.businessList[index].description
                    : controller.techList[index].description,
              ),
              Text(
                isBusiness
                    ? controller.businessList[index].author
                    : controller.techList[index].author,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          color: ColorManager().darkBlueColor,
        ),
        itemCount: isBusiness
            ? controller.businessList.length
            : controller.techList.length,
      ),
    );
  }
}
