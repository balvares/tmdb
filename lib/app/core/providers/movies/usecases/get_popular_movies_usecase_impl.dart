import '../domain/entities/movie_entity.dart';
import 'interfaces/get_popular_movies_usecase.dart';
import '../repositories/interfaces/movie_repository.dart';

class GetPopularMoviesUsecaseImpl implements GetPopularMoviesUsecase {
  final MovieRepository _repository;

  GetPopularMoviesUsecaseImpl({
    required MovieRepository repository,
  }) : _repository = repository;

  @override
  Future<MovieEntity> call() {
    return _repository.getPopularMovies();
  }
}
