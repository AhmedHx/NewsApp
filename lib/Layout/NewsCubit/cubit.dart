import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsCubit/States.dart';
import 'package:newsapp/Modules/Business/businessscreen.dart';
import 'package:newsapp/Modules/Science/ScienceScreen.dart';
import 'package:newsapp/Modules/Settings/SettingScreen.dart';
import 'package:newsapp/Modules/Sport/SportScreen.dart';
import 'package:newsapp/Shared/Network/Local/cache_helper.dart';

import '../../Shared/Network/Remote/diohelper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  bool isDark = CacheHelper.getData(key: 'isDark') == true;

  void changeTheme() {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(ChangeThemeState());
    });
  }

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomitems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];

  void changeBottomBar(int index) {
    if (currentindex != index) {
      currentindex = index;
      emit(NewsBottomNavlState());
    }
    switch (currentindex) {
      case 0:
        getBusiness();
      case 1:
        getSport();
      case 2:
        getScience();
      default:
        getBusiness();
    }
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
    const SettingsScreen()
  ];

  List<dynamic> business = [];
  void getBusiness() {
    emit(GetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apikey': '0afb829d6ccb4416affb8443bb3c0a20'
      },
    ).then((value) {
      business = value.data['articles'];
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];
  void getSport() {
    emit(GetSportLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sport',
        'apikey': '0afb829d6ccb4416affb8443bb3c0a20'
      },
    ).then((value) {
      sport = value.data['articles'];
      emit(GetSportSuccessState());
    }).catchError((error) {
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(GetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apikey': '0afb829d6ccb4416affb8443bb3c0a20'
      },
    ).then((value) {
      science = value.data['articles'];
      emit(GetScienceSuccessState());
    }).catchError((error) {
      emit(GetScienceErrorState(error.toString()));
    });
  }

  //https://newsapi.org/v2/everything?q=tesla&apiKey=0afb829d6ccb4416affb8443bb3c0a20
  List<dynamic> search = [];
  void getSearch(keywords) {
    emit(GetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {'q': '$keywords', 'apikey': '0afb829d6ccb4416affb8443bb3c0a20'},
    ).then((value) {
      search = value.data['articles'];
      print(search[0]);
      emit(GetSearchSuccessState());
    }).catchError((error) {
      emit(GetSearchErrorState(error.toString()));
    });
  }
}
