import 'package:dawaey/modules/Search/search_screen.dart';
import 'package:dawaey/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:news_app/cubit_app/states.dart';
import '../modules/user_home/medicine_list_tab.dart';
import '../shared/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.list_bullet,
      ),
      label: 'List',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.mosque,
      ),
      label: 'Charity',
    ),
  ];
  List<Widget> screens = [
    MedicineListTab(),
    SearchPage(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getMedicineList();
    }
    if (index == 1) {
      getCharityLocation();
    }
    //if(index==2){getScience();}
    emit(NewsBottomNavState());
  }

  List<dynamic> medicine = [];

  void getMedicineList() {
    emit(MedicineLoadingState());
    DioHelper.getData(url: 'user/select_medcine.php', query: {
      //'country':'eg',
      //'category':'medcine',
      //'apiKey':'87fffd0a3b67430b870a569522d54022',
    }).then((value) {
      //print(value.data.toString());
      medicine = value?.data['articles'];
      print(medicine[0]['title']);
      emit(GetMedicineSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetMedicineErrorState(onError.toString()));
    });
  }

  List<dynamic> charity = [];

  void getCharityLocation() {
    emit(CharityLocationLoadingState());
    if (charity.isEmpty) {
      DioHelper.getData(url: 'user/select_locations.php', query: {
        // 'country':'eg',
        'category': 'locations',
        //'apiKey':'87fffd0a3b67430b870a569522d54022',
      }).then((value) {
        //print(value.data.toString());
        charity = value?.data['articles'];
        print(charity[0]['title']);
        emit(GetCharityLocationSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetCharityLocationErrorState(onError.toString()));
      });
    } else {
      emit(GetCharityLocationSuccessState());
    }
  }

  List<dynamic> science = [];

// void getScience(){
//   emit(NewsScienceLoadingState());
//   if(science.isEmpty){
//     DioHelper.getData(
//       url: 'v2/top-headlines',
//       query: {
//         'country':'eg',
//         'category':'science',
//         'apiKey':'87fffd0a3b67430b870a569522d54022',
//
//       }).then((value){
//     //print(value.data.toString());
//     science=value?.data['articles'];
//     print(science[0]['title']);
//     emit(NewsGetScienceSuccessState());
//   }).catchError((onError){
//     print(onError.toString());
//     emit(NewsGetScienceErrorState(onError));
//   });}else{
//     emit(NewsGetScienceSuccessState());
//   }
//
// }
  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/everything', query: {
      'q': value,
      'apiKey': '87fffd0a3b67430b870a569522d54022',
    }).then((value) {
      //print(value.data.toString());
      search = value?.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSearchErrorState(onError));
    });
  }

//bool isDark=false;
//void changeAppMode(){
//isDark=!isDark;

//emit(AppChangeModeState());
//}
}
