import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/bloc/genre/genre_bloc.dart';
import 'package:project/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:project/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import '../../data/repositories/movie_repository/movie_repository.dart';
import 'components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routesName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopRatedMovieBloc(movieRepository: GetIt.I<MovieRepository>())
            ..add(LoadTopRatedMovieEvent()),
        ),
        BlocProvider<PopularMovieBloc>(
          create: (context) =>
              PopularMovieBloc(movieRepository: GetIt.I<MovieRepository>())
                ..add(LoadPopularMovieEvent()),
        ),
        BlocProvider(
          create: (context) =>
              GenreBloc(movieRepository: GetIt.I<MovieRepository>())
                ..add(LoadGenreEvent()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ListView(
              children: [
                CustomAppBar(),
                const SizedBox(height: 30),
                const GenreList(),
                const SizedBox(height: 15),
                const CategoryTitle(categoryTitle: 'Top Rated'),
                const SizedBox(height: 15),
                const TopRatedMovie(),
                const SizedBox(height: 15),
                const CategoryTitle(categoryTitle: 'Popular'),
                const SizedBox(height: 15),
                const PopularMovie()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
