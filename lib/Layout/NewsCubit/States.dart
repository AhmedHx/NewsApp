// ignore_for_file: file_names

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class ChangeThemeState extends NewsStates{}

class NewsBottomNavlState extends NewsStates {}



class GetBusinessLoadingState extends NewsStates {}

class GetBusinessErrorState extends NewsStates {
  final String error;

  GetBusinessErrorState(this.error);
}

class GetBusinessSuccessState extends NewsStates{}



class GetSportLoadingState extends NewsStates {}

class GetSportErrorState extends NewsStates {
  final String error;

  GetSportErrorState(this.error);
}

class GetSportSuccessState extends NewsStates{}


class GetScienceLoadingState extends NewsStates {}

class GetScienceErrorState extends NewsStates {
  final String error;

  GetScienceErrorState(this.error);
}

class GetScienceSuccessState extends NewsStates{}