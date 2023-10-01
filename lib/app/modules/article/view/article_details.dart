import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  final bool isBusiness;
  final String title;
  final String description;
  final String content;
  final String publishTime;
  final String imgUrl;
  final String author;
  final String url;
  const ArticleDetails({
    super.key,
    required this.isBusiness,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.author,
    required this.content,
    required this.publishTime,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 300,
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl),
              ),
            ),
          ),
          SeparatedColumn(
            separatorBuilder: () => const SizedBox(height: 10),
            padding: const EdgeInsets.all(10),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Author: $author',
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
              Text(
                'Published: $publishTime',
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    if (!await canLaunchUrl(Uri.parse(url))) {
                      throw 'Could not launch $url';
                    }
                    final encodedUrl = Uri.encodeFull(url);
                    await launchUrl(Uri.parse(encodedUrl));
                  } catch (e) {
                    Get.snackbar("Error Opening", "Couldn't open the link");
                  }
                },
                child: const Text(
                  'View Full News',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
