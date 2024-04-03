import 'interfaces/movie_rating_repository.dart';
import '../domain/models/requests/movie_rating_request.dart';
import '../datasources/interfaces/movie_rating_datasource.dart';

class MovieRatingRepositoryImpl implements MovieRatingRepository {
  final MovieRatingDatasource _datasource;

  MovieRatingRepositoryImpl({
    required MovieRatingDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<bool> sendRating(MovieRatingRequest request) {
    return _datasource.sendRating(request);
  }
}
