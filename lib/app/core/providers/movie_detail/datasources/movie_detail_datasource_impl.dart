import 'interfaces/movie_detail_datasource.dart';
import '../domain/models/movie_detail_model.dart';
import '../../../shared/errors/http_exception.dart';
import '../../../shared/utils/get_connect_base.dart';
import '../domain/entities/movie_detail_entity.dart';

class MovieDetailDatasourceImpl implements MovieDetailDatasource {
  final GetConnectBase _getConnect;

  MovieDetailDatasourceImpl({
    required GetConnectBase getConnect,
  }) : _getConnect = getConnect;

  @override
  Future<MovieDetailEntity> getMovieDetail(int id) async {
    try {
      var response = await _getConnect.get(
        'movie/${id.toString()}?language=pt-BR',
        headers: await _getConnect.authHeader(),
      );

      if (response.isOk) {
        return MovieDetailModel.fromJson(response.body);
      } else {
        throw HttpException.fromJson(response.body);
      }
    } catch (error) {
      rethrow;
    }
  }
}
