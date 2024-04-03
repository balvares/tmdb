import 'interfaces/movie_detail_repository.dart';
import '../domain/entities/movie_detail_entity.dart';
import '../datasources/interfaces/movie_detail_datasource.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailDatasource _datasource;

  MovieDetailRepositoryImpl({
    required MovieDetailDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<MovieDetailEntity> getMovieDetail(int id) async {
    return _datasource.getMovieDetail(id);
  }
}
