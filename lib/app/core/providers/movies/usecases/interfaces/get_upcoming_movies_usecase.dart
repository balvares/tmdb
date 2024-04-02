import 'package:tmdb/app/core/providers/movies/domain/entities/movie_entity.dart';

abstract interface class GetUpcomingMoviesUsecase {
  Future<MovieEntity> call();
}
