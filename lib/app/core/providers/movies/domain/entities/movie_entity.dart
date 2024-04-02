import 'package:tmdb/app/core/providers/movies/domain/entities/movie_result_entity.dart';

class MovieEntity {
  final int page;
  final List<MovieResultEntity> result;
  final int totalPages;
  final int totalResults;

  MovieEntity({
    required this.page,
    required this.result,
    required this.totalPages,
    required this.totalResults,
  });
}
