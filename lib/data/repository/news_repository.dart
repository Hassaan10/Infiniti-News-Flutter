import 'package:infiniti_news_flutter/data/network/api_response.dart';

abstract class NewsRepository {
  Future<ApiResponse> fetchHeadlines();
  Future<ApiResponse> fetchAllNews();
}