import 'package:flutter/material.dart';
import 'package:project/data/models/models.dart';
import 'package:project/data/models/movies_genre_model/movies_genre_model.dart';

class GenreCard extends StatelessWidget {
  final MoviesGenre genre;
  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.withAlpha(50), borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(genre.name.toLowerCase(), style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.normal),),
          ),
        ),
      ],
    );
  }
}
