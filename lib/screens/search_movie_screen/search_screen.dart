import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/bloc/search_movie/search_movie_bloc.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';
import 'components/gird_movie_list.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  static const routesName = '/search';

  @override
  Widget build(BuildContext context) {
    final query = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => SearchMovieBloc(movieRepository: GetIt.I<MovieRepository>())
        ..add(
          SearchMovie(query: query),
        ),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieStateSuccess) {
                  return GridMovieList(movies: state.movies!);
                }
                if (state is SearchMovieFailedState) {
                  return Center(child: Text(state.error));
                }
                if (state is SearchingMovieStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
