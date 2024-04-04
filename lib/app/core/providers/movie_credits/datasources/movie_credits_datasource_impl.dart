import 'interfaces/movie_credits_datasource.dart';
import '../domain/models/movie_credits_model.dart';
import '../../../shared/errors/http_exception.dart';
import '../../../shared/utils/get_connect_base.dart';
import '../domain/entities/movie_credits_entity.dart';

class MovieCreditsDatasourceImpl implements MovieCreditsDatasource {
  final GetConnectBase _getConnect;

  MovieCreditsDatasourceImpl({
    required GetConnectBase getConnect,
  }) : _getConnect = getConnect;

  @override
  Future<List<MovieCreditsEntity>> getMovieCredits(int id) async {
    try {
      var response = await _getConnect.get(
        'movie/${id.toString()}/credits',
        headers: await _getConnect.authHeader(),
      );

      if (response.isOk) {
        return MovieCreditsModel.fromListJson(response.body['cast']);
      } else {
        throw HttpException.fromJson(response.body['cast']);
      }
    } catch (error) {
      rethrow;
    }
  }
}
