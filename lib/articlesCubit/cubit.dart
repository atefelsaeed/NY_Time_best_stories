import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_best_stories/articlesCubit/states.dart';
import 'package:nyt_best_stories/models/article_model.dart';

import 'package:nyt_best_stories/shared/network/remote/dio_helper.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  ArticlesCubit() : super(ArticlesInitialState());

  static ArticlesCubit get(context) => BlocProvider.of(context);

  // List<dynamic> business = [];

  ArticleDataModel articleDataModel = ArticleDataModel();

  void getBusiness() {
    emit(ArticlesGetBusinessLoadingState());

    DioHelper.getData(
      url: 'svc/topstories/v2/home.json',
      query: {
        'api-key': '3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9',
      },
    ).then((value) {
      // business = value.data['results'];
      articleDataModel = ArticleDataModel.fromJson(value.data);
      emit(ArticlesGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ArticlesGetBusinessErrorState(error.toString()));
    });
  }
}
