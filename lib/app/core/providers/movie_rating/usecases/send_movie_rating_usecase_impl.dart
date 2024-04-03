import 'interfaces/send_movie_rating_usecase.dart';
import '../domain/models/requests/movie_rating_request.dart';
import '../repositories/interfaces/movie_rating_repository.dart';

class SendMovieRatingUsecaseImpl implements SendMovieRatingUsecase {
  final MovieRatingRepository _repository;

  SendMovieRatingUsecaseImpl({
    required MovieRatingRepository repository,
  }) : _repository = repository;

  @override
  Future<bool> call(MovieRatingRequest request) {
    return _repository.sendRating(request);
  }
}
