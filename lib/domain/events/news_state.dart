
import 'package:equatable/equatable.dart';

import '../../data/model/news_article.dart';

enum NewsStatus { loading, success, failure }

final class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.loading,
    this.articles = const <Article>[],
    this.error = ""
  });

  final NewsStatus status;
  final List<Article> articles;
  final String error;

  NewsState copyWith({
    NewsStatus? status,
    List<Article>? articles,
    String? error
  }) {
    return NewsState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      error: error ?? this.error
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, , articles: ${articles.length} }''';
  }

  @override
  List<Object> get props => [status, articles, error];
}