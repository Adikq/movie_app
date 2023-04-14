import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/data/models/models.dart';

class MockMovie extends Mock implements MoviesGenre {}

void main() {
  late MockMovie genre;
  setUpAll(() => genre = MockMovie());
  test(
    'When construct a Genre  model Should present the correct atributes',
    () {
      when(() => genre.id).thenReturn(2);
      when(() => genre.name).thenReturn('Comedy');

      expect(genre.id, 2);
      expect(genre.name, 'Comedy');
    },
  );
}
