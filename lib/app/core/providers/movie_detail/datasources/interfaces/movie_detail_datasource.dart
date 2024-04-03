import '../../domain/entities/movie_detail_entity.dart';

abstract interface class MovieDetailDatasource {
  Future<MovieDetailEntity> getMovieDetail(int id);
}
