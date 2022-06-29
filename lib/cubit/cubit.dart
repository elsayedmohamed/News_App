import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/models/busniess_screen.dart';
import 'package:news_app/models/science_screen.dart';
import 'package:news_app/models/sports_screen.dart';

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
        icon: Icon(Icons.business_center_rounded), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_rounded), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Business'),
  ];
}
