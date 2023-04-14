import 'package:project/screens/home_screen/home_screen.dart';
import 'package:project/screens/movie_details_screen/movie_details.dart';
import 'package:project/screens/search_movie_screen/search_screen.dart';

final routes = {
        HomeScreen.routesName: (context) => const HomeScreen(),
        SearchMovieScreen.routesName: (context) => const SearchMovieScreen(),
        MovieDetails.routesName: (context) => MovieDetails()
      };