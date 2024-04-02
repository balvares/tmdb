import 'package:tmdb/app/core/providers/movies/domain/entities/movie_entity.dart';

abstract interface class GetPopularMoviesUsecase {
  Future<MovieEntity> call();
}
