abstract class ArticlesStates {}

class ArticlesInitialState extends ArticlesStates {}

class ArticlesGetBusinessLoadingState extends ArticlesStates {}

class ArticlesGetBusinessSuccessState extends ArticlesStates {}

class ArticlesGetBusinessErrorState extends ArticlesStates {
  final String error;

  ArticlesGetBusinessErrorState(this.error);
}
