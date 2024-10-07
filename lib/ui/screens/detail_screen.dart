import 'package:flutter/material.dart';
import 'package:infiniti_news_flutter/data/model/news_article.dart';
import '../sections/all_news_section.dart';
import '../sections/headlines_section.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(article.urlToImage!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(article.title, style: const TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),),
                  Text(article.description??""),
                  Text(article.content??"")
                ],
              ),
            )
          ],
      ),
    );
  }
}
