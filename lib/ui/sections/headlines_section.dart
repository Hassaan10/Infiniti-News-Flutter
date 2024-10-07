import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infiniti_news_flutter/domain/bloc/headlines_bloc.dart';
import 'package:infiniti_news_flutter/ui/components/headline_item.dart';

import '../../data/di/service_locator.dart';
import '../../domain/events/news_event.dart';
import '../../domain/events/news_state.dart';

class HeadLinesSection extends StatelessWidget {

  const HeadLinesSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<HeadlinesBloc>()..add(NewsFetched()),
      child: BlocBuilder<HeadlinesBloc, NewsState>(
        builder: (context, state) {
          switch (state.status) {
            case NewsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case NewsStatus.success:
              return SizedBox(
                width: size.width,
                height: 250,
                child: Column(
                  children: [
                    const Text("Headlines", style: TextStyle(color: Colors.red, fontSize: 20),),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          return HeadLineItem(article: state.articles[index]);
                        },
                      ),
                    ),
                  ],
                ),
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

