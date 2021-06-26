abstract class ArticlesStates {}

class ArticlesInitialState extends ArticlesStates {}

// class NewsBottomNavState extends NewsStates {}

class ArticlesGetBusinessLoadingState extends ArticlesStates {}

class ArticlesGetBusinessSuccessState extends ArticlesStates {}

class ArticlesGetBusinessErrorState extends ArticlesStates {
  final String error;

  ArticlesGetBusinessErrorState(this.error);
}

// class NewsGetSportsLoadingState extends NewsStates {}
//
// class NewsGetSportsSuccessState extends NewsStates {}
//
// class NewsGetSportsErrorState extends NewsStates {
//   final String error;
//
//   NewsGetSportsErrorState(this.error);
// }
//
// class NewsGetScienceLoadingState extends NewsStates {}
//
// class NewsGetScienceSuccessState extends NewsStates {}
//
// class NewsGetScienceErrorState extends NewsStates {
//   final String error;
//
//   NewsGetScienceErrorState(this.error);
// }
//
// class NewsGetSearchLoadingState extends NewsStates {}
//
// class NewsGetSearchSuccessState extends NewsStates {}
//
// class NewsGetSearchErrorState extends NewsStates {
//   final String error;
//
//   NewsGetSearchErrorState(this.error);
// }
