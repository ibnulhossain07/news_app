import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/model/news_model.dart';
import 'package:news_app/app/data/theme/color_manager.dart';
import 'package:news_app/app/modules/article/view/article_details.dart';
import 'package:news_app/app/modules/article/view/article_list.dart';
import 'package:news_app/app/widget/error_container.dart';
import 'package:news_app/app/widget/loading_container.dart';

class ArticleListView extends StatelessWidget {
  final bool isLoading;
  final List<Article> articles;
  final int itemCount;
  final String errorMessage;
  final bool isBusiness;
  const ArticleListView({
    super.key,
    required this.isLoading,
    required this.articles,
    required this.itemCount,
    required this.errorMessage,
    this.isBusiness = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              isBusiness ? "Top Business News" : "Top Tech News",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager().darkBlueColor,
              ),
              onPressed: () {
                Get.to(
                  ArticleList(
                    isBusiness: isBusiness,
                  ),
                );
              },
              child: const Text(
                'More',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          color: ColorManager().darkBlueColor,
        ),
        isLoading
            ? const LoadingContainer()
            : errorMessage.isNotEmpty
                ? ErrorContainer(errorMessage: errorMessage)
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => Get.to(
                          ArticleDetails(
                            isBusiness: isBusiness,
                            title: articles[index].title,
                            description: articles[index].description,
                            imgUrl: articles[index].urlToImage,
                            publishTime: articles[index].publishedAt.toString(),
                            content: articles[index].content,
                            author: articles[index].author,
                            url: articles[index].url,
                          ),
                        ),
                        isThreeLine: true,
                        titleAlignment: ListTileTitleAlignment.top,
                        contentPadding: EdgeInsets.zero,
                        title: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => const Icon(
                              Icons.warning_rounded,
                              color: Colors.red,
                            ),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl: articles[index].urlToImage,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              articles[index].title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(articles[index].description),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: ColorManager().darkBlueColor.withOpacity(.5),
                    ),
                    itemCount: itemCount,
                  ),
      ],
    );
  }
}
