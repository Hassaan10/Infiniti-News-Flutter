
import 'package:flutter/material.dart';
import 'package:infiniti_news_flutter/data/model/news_article.dart';
import 'package:infiniti_news_flutter/ui/screens/detail_screen.dart';

class AllNewsItem extends StatelessWidget {
  final Article article;
  const AllNewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(article.urlToImage!=null && article.urlToImage!.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(article: article,)));},
        child: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image.network(article.urlToImage!, width:size.width),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(article.title, style: const TextStyle(color: Colors.white, fontSize: 16),),
              )
            ],
          ),
        ),
      );
    }
    else {
      return Container();
    }
  }
}
