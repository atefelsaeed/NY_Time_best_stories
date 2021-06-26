import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_best_stories/articlesCubit/cubit.dart';
import 'package:nyt_best_stories/articlesCubit/states.dart';
import 'package:nyt_best_stories/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = ArticlesCubit.get(context).articleDataModel;

        // var list = ArticlesCubit.get(context).business;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'NYT Best Stories'
            ),
          ),
          body: articleBuilder(list, context),
        );
      },
    );
  }
}
