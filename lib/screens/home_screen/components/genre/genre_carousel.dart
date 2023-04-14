import 'package:flutter/material.dart';
import 'package:project/data/models/movies_genre_model/movies_genre_model.dart';
import 'package:project/screens/home_screen/components/genre/genre_card.dart';

class GenreCarousel extends StatelessWidget {
  final List<MoviesGenre> genres;
  const GenreCarousel({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemBuilder: (context, index) => GenreCard(
          genre: genres[index],
        ),
        itemCount: genres.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
