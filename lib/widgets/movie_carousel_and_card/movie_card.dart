import 'package:flutter/material.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';
import 'package:project/screens/screens.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, MovieDetails.routesName, arguments: movie),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:
                    NetworkImage(MovieRepository.imageUrl + movie.posterPath!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
