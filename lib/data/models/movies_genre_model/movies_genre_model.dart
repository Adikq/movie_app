
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_genre_model.g.dart';

@JsonSerializable()
class MoviesGenre extends Equatable {
  final int id;
  final String name;
  
  const MoviesGenre({required this.id, required this.name});

  factory MoviesGenre.fromJson(Map<String, dynamic> json) => _$MoviesGenreFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesGenreToJson(this);
  
  @override

  List<Object> get props => [id, name];
}
