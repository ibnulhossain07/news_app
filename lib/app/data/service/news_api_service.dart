import 'package:news_app/app/data/base_api/api_url.dart';
import 'package:news_app/app/data/base_api/base_client.dart';

class NewsApiService {
  fetchTechNews() async {
    return await BaseApiClient().get(endPoint: ApiUrl.techCrunch);
  }

  fetchBusinessNews() async {
    return await BaseApiClient().get(endPoint: ApiUrl.businessHeadlines);
  }
}
