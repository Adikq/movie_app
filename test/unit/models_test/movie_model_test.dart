import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/data/models/movie_model/movie_model.dart';

class MockMovie extends Mock implements Movie {}

void main() {
  late MockMovie movie;
  setUpAll(() => movie = MockMovie());
  test(
    'When construct a Movie model Should present the correct atributes',
    () {
      when(() => movie.title).thenReturn('The Super Mario Bros. Movie');
      when(() => movie.backdropPath)
          .thenReturn('/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg');
      when(() => movie.id).thenReturn(502356);
      when(() => movie.originalLanguage).thenReturn('en');
      when(() => movie.voteAverage).thenReturn(7.5);
      when(() => movie.voteCount).thenReturn(631);
      when(() => movie.overview).thenReturn(
        "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
      );
      when(() => movie.popularity).thenReturn(9065.306);
      when(() => movie.releaseDate).thenReturn("2023-04-05");
      when(() => movie.posterPath)
          .thenReturn("/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg");

      expect(movie.title, 'The Super Mario Bros. Movie');
      expect(movie.backdropPath, '/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg');
      expect(movie.id, 502356);
      expect(movie.originalLanguage, 'en');
      expect(movie.voteAverage, 7.5);
      expect(movie.voteCount, 631);
      expect(
        movie.overview,
        "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
      );
      expect(movie.popularity, 9065.306);
      expect(
        movie.overview,
        "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
      );
      expect(movie.releaseDate, "2023-04-05");
      expect(movie.posterPath, "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg");
    },
  );
}
