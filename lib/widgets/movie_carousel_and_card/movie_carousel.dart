import 'package:flutter/material.dart';
import 'package:project/data/models/movie_model/movie_model.dart';

import 'movie_card.dart';


class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 15,);
        },
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(movie: movies[index],);
        },
      ),
    );
  }
}