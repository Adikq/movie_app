part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieEvent {}


class SearchMovie extends SearchMovieEvent {
  final String query;

  SearchMovie({this.query = ''}); 
}