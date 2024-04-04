import 'package:tmdb/app/core/providers/movie_credits/domain/entities/movie_credits_entity.dart';

class MovieCreditsModel extends MovieCreditsEntity {
  MovieCreditsModel({
    super.adult,
    super.gender,
    required super.id,
    super.knownForDepartment,
    super.name,
    super.originalName,
    super.popularity,
    super.profilePath,
    super.castId,
    super.character,
    super.creditId,
    super.order,
  });

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) =>
      MovieCreditsModel(
        adult: json['adult'],
        gender: json['gender'],
        id: json['id'],
        knownForDepartment: json['known_for_department'],
        name: json['name'],
        originalName: json['original_name'],
        popularity: json['popularity'],
        profilePath: json['profile_path'],
        castId: json['cast_id'],
        character: json['character'],
        creditId: json['credit_id'],
        order: json['order'],
      );

  static List<MovieCreditsModel> fromListJson(List<dynamic> listJson) {
    return listJson
        .map((e) => MovieCreditsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
