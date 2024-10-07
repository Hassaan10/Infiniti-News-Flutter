
import 'package:json_annotation/json_annotation.dart';

import 'news_article.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'news_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;


  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
    });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$NewsResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NewsResponseToJson`.
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
  }


