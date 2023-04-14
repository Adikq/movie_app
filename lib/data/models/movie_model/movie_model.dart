import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final String title;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final double voteCount;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  const Movie(
      {required this.title,
      required this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.voteAverage,
      required this.voteCount,
      required this.overview,
      required this.releaseDate,
      required this.popularity,
      required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [
        title,
        backdropPath,
        id,
        originalLanguage,
        voteAverage,
        voteCount,
        override,
        releaseDate,
        popularity,
        posterPath
      ];
}
