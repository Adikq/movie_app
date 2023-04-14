part of 'top_rated_movie_bloc.dart';

@immutable
abstract class TopRatedMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopRatedMovieInitialState extends TopRatedMovieState {
  @override
  List<Object?> get props => [];
}

class TopRatedMovieLoadingState extends TopRatedMovieState {
  @override
  List<Object?> get props => [];
}

class TopRatedMovieLoadedState extends TopRatedMovieState {
  final List<Movie>? movies;

  TopRatedMovieLoadedState({required this.movies});
  @override
  List<Object?> get props => [movies];
}

class TopRatedMovieFailedState extends TopRatedMovieState {
  final String error;

  TopRatedMovieFailedState({this.error = ''});
  @override
  List<Object?> get props => [error];
}
