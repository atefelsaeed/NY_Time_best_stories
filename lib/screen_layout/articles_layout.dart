import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nyt_best_stories/articlesCubit/cubit.dart';
import 'package:nyt_best_stories/articlesCubit/states.dart';
import 'package:nyt_best_stories/modules/business/business_screen.dart';

class ArticlesLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ArticlesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {
              //     navigateTo(context, SearchScreen());
              //   },
              // ),
              // IconButton(
              //   icon: Icon(
              //     Icons.brightness_4_outlined,
              //   ),
              //   onPressed: () {
              //     AppCubit.get(context).changeAppMode();
              //   },
              // ),
            ],
          ),
          body: BusinessScreen()
          // cubit.screens[cubit.currentIndex],
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: cubit.currentIndex,
          //   onTap: (index) {
          //     cubit.changeBottomNavBar(index);
          //   },
          //   items: cubit.bottomItems,
          // ),
        );
      },
    );
  }
}
