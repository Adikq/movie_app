import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/widgets/movie_carousel_and_card/movie_carousel.dart';

class TopRatedMovie extends StatelessWidget {
  const TopRatedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
      builder: (context, state) {
        if (state is TopRatedMovieLoadedState) {
          return MovieCarousel(movies: state.movies!);
        }
        if (state is TopRatedMovieLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TopRatedMovieFailedState) {
          return Center(child: Text(state.error));
        } else {
          return Container();
        }
      },
    );
  }

  
}
