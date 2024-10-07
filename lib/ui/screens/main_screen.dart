import 'package:flutter/material.dart';
import '../sections/all_news_section.dart';
import '../sections/headlines_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Column(children: [
          Text("Hello"),
          Text("Explore the news around the world")
        ]),
      ),
      body: const SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeadLinesSection(),
            AllNewsSection()
          ],
        ),
      ),
    );
  }
}
