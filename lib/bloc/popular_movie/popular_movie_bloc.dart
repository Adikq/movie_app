import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final MovieRepository movieRepository;
  PopularMovieBloc({required this.movieRepository}) : super(PopularMovieInitialState()) {
    on<LoadPopularMovieEvent>(_loadPopularMovie);
  }
  
  _loadPopularMovie(LoadPopularMovieEvent event, Emitter<PopularMovieState> emit) async {
    try {
      emit(PopularMovieLoadingState());
      final List<Movie>movies = await movieRepository.getPopularMovie();
      emit(PopularMovieLoadedState(movies: movies));
    } on SocketException catch(_) {
      emit(PopularMovieFailedState(error: 'Socket Exception'));
    } catch (e) {
      emit(PopularMovieFailedState(error: e.toString()));
    }
  }
}
