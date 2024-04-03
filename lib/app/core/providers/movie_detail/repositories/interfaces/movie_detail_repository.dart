import '../../domain/entities/movie_detail_entity.dart';

abstract interface class MovieDetailRepository {
  Future<MovieDetailEntity> getMovieDetail(int id);
}
