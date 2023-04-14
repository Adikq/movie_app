part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PopularMovieInitialState extends PopularMovieState {
  @override
  List<Object?> get props => [];
}

class PopularMovieLoadingState extends PopularMovieState {
  @override
  List<Object?> get props => [];
}

class PopularMovieLoadedState extends PopularMovieState {
  final List<Movie>? movies;

  @override
  List<Object?> get props => [movies];
  PopularMovieLoadedState({this.movies});
}

class PopularMovieFailedState extends PopularMovieState {
  final String? error;

  @override
  List<Object?> get props => [error];
  PopularMovieFailedState({this.error});
}
