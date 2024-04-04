import 'interfaces/get_movie_credits_usecase.dart';
import '../domain/entities/movie_credits_entity.dart';
import '../repositories/interfaces/movie_credits_repository.dart';

class GetMovieCreditsUsecaseImpl implements GetMovieCreditsUsecase {
  final MovieCreditsRepository _repository;

  GetMovieCreditsUsecaseImpl({
    required MovieCreditsRepository repository,
  }) : _repository = repository;

  @override
  Future<List<MovieCreditsEntity>> call(int id) {
    return _repository.getMovieCredits(id);
  }
}
