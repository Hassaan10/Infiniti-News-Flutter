import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infiniti_news_flutter/data/model/news_article.dart';
import 'package:infiniti_news_flutter/ui/components/headline_item.dart';

import '../../data/di/service_locator.dart';
import '../../domain/bloc/all_news_bloc.dart';
import '../../domain/events/news_event.dart';
import '../../domain/events/news_state.dart';
import '../components/all_news_item.dart';

class AllNewsSection extends StatelessWidget {

  const AllNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AllNewsBloc>()..add(NewsFetched()),
      child: BlocBuilder<AllNewsBloc, NewsState>(
          builder: (context, state) {
            switch (state.status) {
              case NewsStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case NewsStatus.success:
                return Column(
                  children: [
                    const Text("All News Around the world", style: TextStyle(color: Colors.red, fontSize: 20),),
                    ListView.builder(
                      primary: false,
                      itemCount: state.articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AllNewsItem(article: state.articles[index]);
                      },
                    ),
                  ],
                );
              case NewsStatus.failure:
                var snackBar = SnackBar(
                  content: Text(state.error),
                );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return Text(state.error);
            }
          },
        ),
    );
  }
}
