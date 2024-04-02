import 'package:tmdb/app/core/providers/movies/domain/entities/movie_entity.dart';

abstract interface class MovieDatasource {
  Future<List<MovieEntity>> getUpcomingMovies();

  Future<List<MovieEntity>> getPopularMovies();
}
