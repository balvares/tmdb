import 'package:tmdb/app/core/providers/movies/domain/entities/movie_entity.dart';
import 'package:tmdb/app/core/providers/movies/domain/models/movie_result_model.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.page,
    required super.totalPages,
    required super.totalResults,
    required super.result,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      page: json['page'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
      result: fromListJson(json['results'] as List<dynamic>),
    );
  }

  static List<MovieResultModel> fromListJson(List<dynamic> listJson) {
    return listJson
        .map((e) => MovieResultModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
