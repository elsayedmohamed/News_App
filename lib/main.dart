import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/shared/remote/dio_helper.dart';

import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: MyBlocObserver());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()..getBusiness(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          textTheme: TextTheme(
              headline3:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          primarySwatch: Colors.blue,
        ),
        home: const NewsLayout(),
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
