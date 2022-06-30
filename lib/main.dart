import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/local/chache_helper.dart';
import 'package:news_app/shared/remote/dio_helper.dart';

import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  BlocOverrides.runZoned(() => runApp(MyApp(isDark: isDark!)),
      blocObserver: MyBlocObserver());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp({required this.isDark});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()
        ..getBusiness()
        ..changeAppThemeMode(fromShared: isDark),
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
              textTheme: const TextTheme(
                  headline3:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
              ),
              appBarTheme: AppBarTheme(color: HexColor('#6b6863')),
              cardTheme: CardTheme(
                color: HexColor('#6b6863'),
              ),
              canvasColor: HexColor('#6b6863'),
              textTheme: TextTheme(
                  headline3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )).copyWith(
                  bodyMedium: TextStyle(color: Colors.white, fontSize: 15.0)),
              primarySwatch: Colors.blue,
            ),
            themeMode: NewsAppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
