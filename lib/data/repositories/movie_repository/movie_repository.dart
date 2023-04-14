import 'package:dio/dio.dart';
import 'package:project/data/models/models.dart';
import 'package:project/data/repositories/const.dart';

class MovieRepository {
  final Dio client;
  MovieRepository(this.client);

  static const imageUrl = 'https://image.tmdb.org/t/p/w500';

  Future<List<MoviesGenre>> getGenres() async {
    try {
      final response = await client
          .get('$host/genre/movie/list', queryParameters: {'api_key': apiKey});
      final json = response.data;
      final List<MoviesGenre> genres = (json['genres'] as List<dynamic>)
          .map((e) => MoviesGenre.fromJson(e))
          .toList();
      return genres;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movie>> getTopRatedMovie({int page = 1}) async {
    try {
      final response = await client.get('$host/movie/now_playing',
          queryParameters: {'api_key': apiKey, 'page': '$page'});
      final json = response.data;
      final List<Movie> movies = (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();

      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movie>> getPopularMovie({int page = 1}) async {
    try {
      final response = await client.get('$host/movie/popular',
          queryParameters: {'api_key': apiKey, 'page': '$page'});
      final json = response.data;
      final List<Movie> movies = (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movie>> searchMovie({String query = '', int page = 1}) async {
    try {
      final response = await client.get('$host/search/movie', queryParameters: {
        'api_key': apiKey,
        'page': '$page',
        'query': query
      });
      final json = response.data;
      final List<Movie> movies = (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }
}
