abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class MedicineLoadingState extends NewsStates {}

class GetMedicineSuccessState extends NewsStates {}

class GetMedicineErrorState extends NewsStates {
  final String error;

  GetMedicineErrorState(this.error);
}

class CharityLocationLoadingState extends NewsStates {}

class GetCharityLocationSuccessState extends NewsStates {}

class GetCharityLocationErrorState extends NewsStates {
  final String error;

  GetCharityLocationErrorState(this.error);
}

class NewsScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}
