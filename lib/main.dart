import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/config/app_routes.dart';
import 'package:project/config/app_theme.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';
import 'package:project/screens/home_screen/home_screen.dart';

void main() {
  GetIt.I.registerLazySingleton(() => MovieRepository(Dio()));
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(),
      routes: routes,
      initialRoute: HomeScreen.routesName,
      debugShowCheckedModeBanner: false,
    );
  }
}
