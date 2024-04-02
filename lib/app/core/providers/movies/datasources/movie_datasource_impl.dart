import 'interfaces/movie_datasource.dart';
import '../domain/models/movie_model.dart';
import '../domain/entities/movie_entity.dart';
import '../../../shared/errors/http_exception.dart';
import '../../../shared/utils/get_connect_base.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final GetConnectBase _getConnect;

  MovieDatasourceImpl({
    required GetConnectBase getConnect,
  }) : _getConnect = getConnect;

  @override
  Future<MovieEntity> getPopularMovies() async {
    try {
      var response = await _getConnect.get(
        'movie/popular?language=pt-BR',
        headers: await _getConnect.authHeader(),
      );

      if (response.isOk) {
        return MovieModel.fromJson(response.body);
      } else {
        throw HttpException.fromJson(response.body);
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<MovieEntity> getUpcomingMovies() async {
    try {
      var response = await _getConnect.get(
        'movie/upcoming?language=pt-BR',
        headers: await _getConnect.authHeader(),
      );

      if (response.isOk) {
        return MovieModel.fromJson(response.body);
      } else {
        throw HttpException.fromJson(response.body);
      }
    } catch (error) {
      rethrow;
    }
  }
}
