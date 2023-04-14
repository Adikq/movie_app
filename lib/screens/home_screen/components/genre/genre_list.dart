import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/genre/genre_bloc.dart';
import 'package:project/data/models/movies_genre_model/movies_genre_model.dart';
import 'package:project/screens/home_screen/components/genre/genre_carousel.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        if (state is GenreLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GenreLoadingFailedState) {
          return Center(child: Text(state.error));
        }
        if (state is GenreLoadedState) {
          return _buildGenreList(state.genres);
        }
        return const Center(child: Text('Some thing went wrong'));
      },
    );
  }

  Widget _buildGenreList(List<MoviesGenre> genres) =>
      GenreCarousel(genres: genres);
}
