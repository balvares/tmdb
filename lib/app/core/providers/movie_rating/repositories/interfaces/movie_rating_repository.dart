import '../../domain/models/requests/movie_rating_request.dart';

abstract interface class MovieRatingRepository {
  Future<bool> sendRating(MovieRatingRequest request);
}
