import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_best_stories/articlesCubit/cubit.dart';
import 'package:nyt_best_stories/articlesCubit/states.dart';

import 'modules/home/home_screen.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArticlesCubit()..getBusiness(),
      child: BlocConsumer<ArticlesCubit, ArticlesStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NYT Best Stories',
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
