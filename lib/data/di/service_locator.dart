


import 'package:get_it/get_it.dart';
import 'package:infiniti_news_flutter/domain/bloc/all_news_bloc.dart';
import 'package:infiniti_news_flutter/domain/bloc/headlines_bloc.dart';

import '../repository/news_repository.dart';
import '../repository/news_repository_impl.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());
    sl.registerLazySingleton(() => AllNewsBloc(sl()));
    sl.registerLazySingleton(() => HeadlinesBloc(sl()));

  }
}