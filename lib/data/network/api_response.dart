

import '../model/news_article.dart';

class ApiResponse {
  List<Article>? articles;
  String? error;
  ApiResponse({this.articles, this.error});
  ApiResponse.success(this.articles);
  ApiResponse.error(this.error);
  ApiResponse.loading();

  bool get isLoading => error == null && articles == null;
  bool get isSuccess => articles != null;
  bool get isError => error != null;
}
