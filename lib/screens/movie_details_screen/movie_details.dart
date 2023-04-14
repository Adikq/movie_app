import 'package:flutter/material.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';
import 'package:project/screens/home_screen/home_screen.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  static const routesName = '/movieDetails';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(
                            MovieRepository.imageUrl + movie.backdropPath!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () => Navigator.of(context).pushNamed(HomeScreen.routesName),
                      icon: Icon(Icons.arrow_back_ios_new)),
                ],
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        subtitle: Text(movie.releaseDate),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Overview',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                movie.overview,
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
