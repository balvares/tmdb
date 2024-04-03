import '../../domain/entities/movie_rating_entity.dart';
import '../../domain/models/requests/movie_rating_request.dart';

abstract interface class MovieRatingDatasource {
  Future<MovieRatingEntity> getRatedMovies();

  Future<bool> sendRating(MovieRatingRequest request);
}
