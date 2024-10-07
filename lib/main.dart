import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infiniti_news_flutter/domain/bloc/all_news_bloc.dart';
import 'package:infiniti_news_flutter/ui/screens/main_screen.dart';

import 'data/di/service_locator.dart';
import 'domain/bloc/bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  ServiceLocator.init();
  runApp(const App());
}

class App extends MaterialApp {
  const App({super.key}) : super(
      debugShowCheckedModeBanner : false,
      home: const MainScreen()
  );
}

