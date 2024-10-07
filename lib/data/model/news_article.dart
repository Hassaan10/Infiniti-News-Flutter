
import 'package:json_annotation/json_annotation.dart';

import 'source.dart';

part 'news_article.g.dart';


@JsonSerializable(explicitToJson: true)
class Article {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$NewsResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NewsResponseToJson`.
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}
