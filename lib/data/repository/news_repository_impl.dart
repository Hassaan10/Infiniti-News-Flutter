
import 'package:infiniti_news_flutter/data/network/api_response.dart';
import 'package:infiniti_news_flutter/data/network/network_service.dart';

import 'news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<ApiResponse> fetchAllNews() async {
    var result = ApiResponse.loading();
    result = await NetworkService.getInstance().call("everything?q=keyword");
    return result;
  }

  @override
  Future<ApiResponse> fetchHeadlines() async {
    var result = ApiResponse.loading();
    result = await NetworkService.getInstance().call("top-headlines?country=us");
    return result;
  }


}