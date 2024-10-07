

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infiniti_news_flutter/domain/events/news_event.dart';
import 'package:infiniti_news_flutter/domain/events/news_state.dart';

import '../../data/repository/news_repository.dart';

class AllNewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  AllNewsBloc(this._newsRepository) : super(const NewsState()) {
    on<NewsFetched>(_onNewsFetched);
  }
  Future<void> _onNewsFetched(NewsFetched event, Emitter<NewsState> emit) async {
    try {
      if (state.status == NewsStatus.loading) {
        final result = await _newsRepository.fetchAllNews();
        if(result.isSuccess) {
          return emit(state.copyWith(
            status: NewsStatus.success,
            articles: result.articles,
          ));
        }
        else {
          emit(state.copyWith(status: NewsStatus.failure, error: result.error));
        }
      }
    } catch (_) {
      emit(state.copyWith(status: NewsStatus.failure, error: "Something went wrong"));
    }
  }

}