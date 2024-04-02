import '../../domain/entities/movie_entity.dart';

abstract interface class MovieDatasource {
  Future<MovieEntity> getUpcomingMovies();

  Future<MovieEntity> getPopularMovies();
}
