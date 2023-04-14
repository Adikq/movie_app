import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project/data/models/movies_genre_model/movies_genre_model.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final MovieRepository movieRepository;
  GenreBloc({required this.movieRepository}) : super(GenreInitialState()) {
    on<LoadGenreEvent>(_loadGenre);
  }
  _loadGenre(event, emit) async {
    try {
      emit(GenreLoadingState());
      final genres = await movieRepository.getGenres();
      emit(GenreLoadedState(genres: genres));
    } on SocketException catch (e) {
       emit(GenreLoadingFailedState(error: e.toString()));
       throw Exception(e);
    } catch (e) {
      emit(GenreLoadingFailedState(error: e.toString()));
      throw Exception(e);
    }
  }
}
