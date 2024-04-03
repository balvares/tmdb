import '../../domain/models/requests/movie_rating_request.dart';

abstract interface class SendMovieRatingUsecase {
  Future<bool> call(MovieRatingRequest request);
}
