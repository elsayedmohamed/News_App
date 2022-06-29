import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/models/busniess_screen.dart';
import 'package:news_app/models/science_screen.dart';
import 'package:news_app/models/sports_screen.dart';

import '../shared/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> titles = [
    'Business',
    'Sports',
    'Science',
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar({required int index}) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_rounded), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
// Get Business ========================================================
  List<dynamic> business = [];
  Future getBusiness() {
    emit(GetBusinessLoadingState());
    return DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '59467ea6cf9a4ad6ac0a3aad9aa84325',
    }).then((value) {
      business = value?.data['articles'];
      print(business);
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  // Get Sports ====================================================
  List<dynamic> sports = [];
  Future getSports() {
    emit(GetSportsLoadingState());
    return DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '59467ea6cf9a4ad6ac0a3aad9aa84325',
    }).then((value) {
      sports.add(value?.data);

      print(sports);

      emit(GetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportsErrorState(error.toString()));
    });
  }

  // Get Sports ====================================================
  List<Map> science = [];
  Future getScience() {
    emit(GetScienceLoadingState());
    return DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '59467ea6cf9a4ad6ac0a3aad9aa84325',
    }).then((value) {
      science.add(value?.data);

      print(science);

      emit(GetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceErrorState(error.toString()));
    });
  }
}
