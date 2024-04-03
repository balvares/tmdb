import 'movie_rating_result_model.dart';
import '../entities/movie_rating_entity.dart';

class MovieRatingModel extends MovieRatingEntity {
  MovieRatingModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MovieRatingModel.fromJson(Map<String, dynamic> json) {
    return MovieRatingModel(
      page: json['page'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
      results: fromListJson(json['results'] as List<dynamic>),
    );
  }

  static List<MovieRatingResultModel> fromListJson(List<dynamic> listJson) {
    return listJson
        .map((e) => MovieRatingResultModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
