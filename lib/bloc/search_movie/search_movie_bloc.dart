import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final MovieRepository movieRepository;
  SearchMovieBloc({required this.movieRepository}) : super(SearchMovieInitial()) {
    on<SearchMovie>(_searchMovie);
  }
  _searchMovie(SearchMovie event, Emitter<SearchMovieState>emit) async {
    try{
      emit(SearchingMovieStateLoading());
      final List<Movie> movies = await movieRepository.searchMovie(query: event.query);
      emit(SearchMovieStateSuccess(movies: movies));
      
    } on SocketException catch(e) {
      emit(SearchMovieFailedState(error: 'Socket Exception'));
      throw Exception(e);
    } 
    catch(e) {
      emit(SearchMovieFailedState(error: e.toString()));
    }
  }
}
