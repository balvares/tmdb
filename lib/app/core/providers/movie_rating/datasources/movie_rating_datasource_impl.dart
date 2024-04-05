import 'dart:convert';

import '../../../shared/utils/enviroment.dart';
import '../domain/models/movie_rating_model.dart';
import 'interfaces/movie_rating_datasource.dart';
import '../../../shared/errors/http_exception.dart';
import '../../../shared/utils/get_connect_base.dart';
import '../domain/entities/movie_rating_entity.dart';
import '../domain/models/requests/movie_rating_request.dart';

class MovieRatingDatasourceImpl implements MovieRatingDatasource {
  final GetConnectBase _getConnect;

  MovieRatingDatasourceImpl({
    required GetConnectBase getConnect,
  }) : _getConnect = getConnect;

  @override
  Future<bool> sendRating(MovieRatingRequest request) async {
    try {
      var response = await _getConnect.post(
        'account/${Environment.accountId}/rated/movies?language=pt-BR',
        request,
        // 'account/${Environment.accountId}/rated/movies?language=pt-BR&session_id=${localStorage.read('sessionId')}',
        headers: await _getConnect.authHeader(),
      );

      if (response.isOk) {
        return json.decode(response.body)[''];
      } else {
        throw HttpException.fromJson(response.body);
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<MovieRatingEntity> getRatedMovies() async {
    try {
      var response = await _getConnect.get(
        'account/${Environment.accountId}/rated/movies?language=pt-BR',
        // 'account/${Environment.accountId}/rated/movies?language=pt-BR&session_id=${localStorage.read('sessionId')}',
        headers: await _getConnect.authHeader(),
      );

      if (response.isOk) {
        return MovieRatingModel.fromJson(response.body);
      } else {
        throw HttpException.fromJson(response.body);
      }
    } catch (error) {
      rethrow;
    }
  }
}
