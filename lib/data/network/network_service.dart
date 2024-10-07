
import 'dart:convert';

import '../model/news_response.dart';
import 'api_response.dart';
import 'package:http/http.dart' as http;


class NetworkService {
  // Private constructor
  NetworkService._();

  // Static instance variable
  static NetworkService? _instance;



  // Factory method to access the singleton instance
  factory NetworkService.getInstance() {
    _instance ??= NetworkService._();
    return _instance!;
  }

  final _baseUrl = "https://newsapi.org/v2/";

  Future<ApiResponse> call(String endPoint) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + endPoint),
          headers: {"X-Api-Key": ""});

      if (response.statusCode == 200) {
        final result = NewsResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);

        return ApiResponse.success(result.articles.cast());
      } else {
        return ApiResponse.error(response.toString());
      }
    }
    catch(ex) {
      return ApiResponse.error(ex.toString());
    }

  }

// Other methods and properties go here
}