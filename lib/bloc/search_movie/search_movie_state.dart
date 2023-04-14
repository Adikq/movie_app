part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieState extends Equatable {}

class SearchMovieInitial extends SearchMovieState {
  @override
  List<Object?> get props => [];
}

class SearchingMovieStateLoading extends SearchMovieState {
  @override
  List<Object?> get props => [];
}

class SearchMovieStateSuccess extends SearchMovieState {
  final List<Movie>? movies;

  SearchMovieStateSuccess({this.movies});

  @override
  List<Object?> get props => [movies];
}

class SearchMovieFailedState extends SearchMovieState {
  final String error;

  SearchMovieFailedState({this.error = ''});

  @override
  List<Object?> get props => [error];
}
