import '../domain/entities/movie_entity.dart';
import 'interfaces/get_upcoming_movies_usecase.dart';
import '../repositories/interfaces/movie_repository.dart';

class GetUpcomingMoviesUsecaseImpl implements GetUpcomingMoviesUsecase {
  final MovieRepository _repository;

  GetUpcomingMoviesUsecaseImpl({
    required MovieRepository repository,
  }) : _repository = repository;

  @override
  Future<MovieEntity> call() {
    return _repository.getUpcomingMovies();
  }
}
