abstract class NewsAppStates {}

class NewsAppInitialState extends NewsAppStates {}

class ChangeBottomNavState extends NewsAppStates {}

class GetBusinessLoadingState extends NewsAppStates {}

class GetBusinessSuccessState extends NewsAppStates {}

class GetBusinessErrorState extends NewsAppStates {
  final String error;

  GetBusinessErrorState(this.error);
}

//====================================================
class GetSportsLoadingState extends NewsAppStates {}

class GetSportsSuccessState extends NewsAppStates {}

class GetSportsErrorState extends NewsAppStates {
  final String error;

  GetSportsErrorState(this.error);
}

//====================================================
class GetScienceLoadingState extends NewsAppStates {}

class GetScienceSuccessState extends NewsAppStates {}

class GetScienceErrorState extends NewsAppStates {
  final String error;

  GetScienceErrorState(this.error);
}

//=======================================================
class ChangeAppThemeModeState extends NewsAppStates {}

//====================================================
class GetSearchLoadingState extends NewsAppStates {}

class GetSearchSuccessState extends NewsAppStates {}

class GetSearchErrorState extends NewsAppStates {
  final String error;

  GetSearchErrorState(this.error);
}
