import 'package:tmdb/app/core/providers/movies/domain/entities/movie_entity.dart';

abstract interface class MovieRepository {
  Future<MovieEntity> getPopularMovies();

  Future<MovieEntity> getUpcomingMovies();
}
