part of 'genre_bloc.dart';

@immutable
abstract class GenreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenreInitialState extends GenreState {
  @override
  List<Object?> get props => [];
}

class GenreLoadingState extends GenreState {
  @override
  List<Object?> get props => [];
}

class GenreLoadedState extends GenreState {
  List<MoviesGenre> genres;
  GenreLoadedState({required this.genres});

  @override
  List<Object?> get props => [genres];
}

class GenreLoadingFailedState extends GenreState {
  final String error;
  GenreLoadingFailedState({this.error = ''});

  @override
  List<Object?> get props => [error];
}
