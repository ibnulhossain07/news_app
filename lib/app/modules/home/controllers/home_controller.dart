import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/base_api/api_exception/api_exception_handler.dart';
import 'package:news_app/app/data/model/news_model.dart';
import 'package:news_app/app/data/service/news_api_service.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController with ExceptionHandler {
  RxBool isLoading = false.obs;
  RxBool isTechLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxString errorTechMessage = ''.obs;
  final businessList = <Article>[].obs;
  final techList = <Article>[].obs;
  final articlesBox = GetStorage();
  RxBool isConnected = false.obs;
  checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }

  void cacheArticle(Article article) {
    final articles = articlesBox.read<List<dynamic>>('cached_articles') ?? [];
    articles.add(article.toMap());
    articlesBox.write('cached_articles', articles);
  }

  List<Article> getCachedArticles() {
    final articles = articlesBox.read<List<dynamic>>('cached_articles') ?? [];
    return articles.map((json) => Article.fromMap(json)).toList();
  }

  getBusinessNews() async {
    try {
      isLoading.value = true;
      var response = await NewsApiService().fetchBusinessNews();

      if (response['status'] == "ok") {
        final articles = NewsModel.fromMap(response).articles;
        businessList.addAll(articles);

        for (var article in articles) {
          cacheArticle(article);
        }
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      errorMessage.value = handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

  getTechNews() async {
    try {
      isTechLoading.value = true;
      var response = await NewsApiService().fetchTechNews();

      if (response['status'] == "ok") {
        final articles = NewsModel.fromMap(response).articles;
        techList.addAll(articles);

        for (var article in articles) {
          cacheArticle(article);
        }
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      errorTechMessage.value = handleError(e);
    } finally {
      isTechLoading.value = false;
    }
  }

  refreshPage() async {
    getBusinessNews();
    getTechNews();
  }

  @override
  void onInit() {
    checkConnectivity();
    getBusinessNews();
    getTechNews();
    super.onInit();
  }
}
