import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:project/bloc/search_movie/search_movie_bloc.dart';
import 'package:project/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:project/data/models/movie_model/movie_model.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';
import 'package:project/screens/home_screen/components/top_rated_movie/top_rated_movie.dart';

class MockMovierepository extends Mock implements MovieRepository {}

void main() {
  late MockMovierepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovierepository();
  });

  const Movie movie = Movie(
    title: '',
    backdropPath: '',
    id: 1,
    originalLanguage: '',
    overview: '',
    popularity: 1,
    posterPath: '',
    releaseDate: '',
    voteAverage: 1,
    voteCount: 1,
  );

  final List<Movie> movies = [movie, movie];

  group('Testing Popular Movie Bloc\n', () {
    blocTest<PopularMovieBloc, PopularMovieState>(
      'emit [PopularMovieLoading, PopularMovieLoaded] when success',
      build: () {
        when(mockMovieRepository.getPopularMovie)
            .thenAnswer((_) => Future.value(movies));
        return PopularMovieBloc(movieRepository: mockMovieRepository);
      },
      act: (bloc) => bloc.add(LoadPopularMovieEvent()),
      expect: () =>
          [PopularMovieLoadingState(), PopularMovieLoadedState(movies: movies)],
    );
    blocTest<PopularMovieBloc, PopularMovieState>(
      'emit [PopularMovieFailedState]-Socket Exception when error is SocketException',
      build: () {
        when(mockMovieRepository.getPopularMovie).thenThrow('Socket Exception');
        return PopularMovieBloc(movieRepository: mockMovieRepository);
      },
      act: (bloc) => bloc.add(LoadPopularMovieEvent()),
      expect: () => [
        PopularMovieLoadingState(),
        PopularMovieFailedState(error: 'Socket Exception')
      ],
    );
  });
  group('Testing Top Rated Movie Bloc\n', () {
    blocTest<TopRatedMovieBloc, TopRatedMovieState>(
      'emit [TopRatedMovieLoading, TopRatedMovieLoaded] when success',
      build: () {
        when(mockMovieRepository.getTopRatedMovie)
            .thenAnswer((_) => Future.value(movies));
        return TopRatedMovieBloc(movieRepository: mockMovieRepository);
      },
      act: (bloc) => bloc.add(LoadTopRatedMovieEvent()),
      expect: () => [
        TopRatedMovieLoadingState(),
        TopRatedMovieLoadedState(movies: movies)
      ],
    );
    blocTest<TopRatedMovieBloc, TopRatedMovieState>(
      'emit [PopularMovieFailedState]-Socket Exception when error is SocketException',
      build: () {
        when(mockMovieRepository.getTopRatedMovie)
            .thenThrow('Socket Exception');
        return TopRatedMovieBloc(movieRepository: mockMovieRepository);
      },
      act: (bloc) => bloc.add(LoadTopRatedMovieEvent()),
      expect: () => [
        TopRatedMovieLoadingState(),
        TopRatedMovieFailedState(error: 'Socket Exception')
      ],
    );
  });
  group('Testing Search Movie Bloc\n', () {
    blocTest<SearchMovieBloc, SearchMovieState>(
      'emit [SearchingMovieStateLoading, SearchMovieStateSuccess] when success',
      build: () {
        when(mockMovieRepository.searchMovie)
            .thenAnswer((_) => Future.value(movies));
        return SearchMovieBloc(movieRepository: mockMovieRepository);
      },
      act: (bloc) => bloc.add(SearchMovie()),
      expect: () => [
        SearchingMovieStateLoading(),
        SearchMovieStateSuccess(movies: movies)
      ],
    );
    blocTest<SearchMovieBloc, SearchMovieState>(
      'emit [PopularMovieFailedState]-Socket Exception  when error is SocketException',
      build: () {
        when(mockMovieRepository.searchMovie).thenThrow('Socket Exception');
        return SearchMovieBloc(movieRepository: mockMovieRepository);
      },
      act: (bloc) => bloc.add(SearchMovie()),
      expect: () => [
        SearchingMovieStateLoading(),
        SearchMovieFailedState(error: 'Socket Exception')
      ],
    );
  });
}
