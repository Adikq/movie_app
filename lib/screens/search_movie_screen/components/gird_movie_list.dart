import 'package:flutter/material.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/widgets/movie_carousel_and_card/movie_card.dart';

class GridMovieList extends StatelessWidget {
  const GridMovieList({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieCard(movie: movies[index],),
    );  
  }
}
