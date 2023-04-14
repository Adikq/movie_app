import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:project/widgets/movie_carousel_and_card/movie_carousel.dart';

class PopularMovie extends StatelessWidget {
  const PopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieBloc, PopularMovieState>(
        builder: (context, state) {
      if (state is PopularMovieLoadedState) {
        return MovieCarousel(movies: state.movies!);
      } else if (state is PopularMovieFailedState) {
        return Center(child: Text(state.error!));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
