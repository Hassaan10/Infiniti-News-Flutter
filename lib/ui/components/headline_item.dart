
import 'package:flutter/material.dart';
import 'package:infiniti_news_flutter/data/model/news_article.dart';

import '../screens/detail_screen.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  const HeadLineItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    if(article.urlToImage != null && article.urlToImage!.isNotEmpty) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(article: article,)));},
        child: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: 300,
              decoration: BoxDecoration(

                image: DecorationImage(image: NetworkImage(article.urlToImage!), fit: BoxFit.cover),
              ),
              alignment: AlignmentDirectional.bottomEnd,
              child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(article.title, style: const TextStyle(color: Colors.white, fontSize: 16),),
                )
            ),
          ),
      );
    }
    else {
      return Container();
    }
  }
}
