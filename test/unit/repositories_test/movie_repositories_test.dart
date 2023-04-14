import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/data/models/models.dart';
import 'package:project/data/repositories/movie_repository/movie_repository.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository mockMovieRepository;

  setUp(() => mockMovieRepository = MockMovieRepository());

  const Movie movie = Movie(
      title: '',
      backdropPath: '',
      id: 12,
      originalLanguage: '',
      voteAverage: 1,
      voteCount: 2,
      overview: 'overview',
      releaseDate: 'releaseDate',
      popularity: 31232,
      posterPath: 'posterPath');
  const genre = MoviesGenre(id: 2, name: 'Comedy');

  final List<Movie> fakeMovies = [movie, movie, movie];
  final List<MoviesGenre> fakeGenres = [genre, genre, genre];

  group(
    'Testing Movie Repository \n',
    () {
      test('get popular movie -- should return list of movie, ', () async {
        when(mockMovieRepository.getPopularMovie)
            .thenAnswer((_) => Future.value(fakeMovies));
        final movies = await mockMovieRepository.getPopularMovie();

        expect(fakeMovies, movies);
      });
      test(
        'get top rated movie should return list of movie, ',
        () async {
          when(() => mockMovieRepository.getTopRatedMovie()).thenAnswer(
            (_) => Future.value(fakeMovies),
          );
          final movies = await mockMovieRepository.getTopRatedMovie();

          expect(fakeMovies, movies);
        },
      );
      test(
        'get searching movies  should return list of movie by query,',
        () async {
          when(() => mockMovieRepository.searchMovie()).thenAnswer(
            (_) => Future.value(fakeMovies),
          );
          final movies = await mockMovieRepository.searchMovie();
          expect(fakeMovies, movies);
        },
      );
    },
  );
  test('get movies genre should return list of movie genre,', () async {
    when(() => mockMovieRepository.getGenres()).thenAnswer(
      (_) => Future.value(fakeGenres),
    );
    final genres = await mockMovieRepository.getGenres();

    expect(fakeGenres, genres);
  });
}
