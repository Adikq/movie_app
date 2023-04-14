import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final MovieRepository movieRepository;
  TopRatedMovieBloc({required this.movieRepository}) : super(TopRatedMovieInitialState()) {
    on<LoadTopRatedMovieEvent>(_loadTopRatedMovie);
  }

  _loadTopRatedMovie(
      LoadTopRatedMovieEvent event, Emitter<TopRatedMovieState> emit) async {
    try {
      emit(TopRatedMovieLoadingState());
      final movies = await movieRepository.getTopRatedMovie();
      emit(TopRatedMovieLoadedState(movies: movies));
    } on SocketException catch(e) {
      emit(TopRatedMovieFailedState(error: 'Socket Exception'));
      throw Exception(e);
    } catch (e) {
      emit(TopRatedMovieFailedState(error: e.toString()));
    }
  }

}
