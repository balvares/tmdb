import 'interfaces/get_movie_detail_usecase.dart';
import '../domain/entities/movie_detail_entity.dart';
import '../repositories/interfaces/movie_detail_repository.dart';

class GetMovieDetailUsecaseImpl implements GetMovieDetailUsecase {
  final MovieDetailRepository _repository;

  GetMovieDetailUsecaseImpl({
    required MovieDetailRepository repository,
  }) : _repository = repository;

  @override
  Future<MovieDetailEntity> call(int id) {
    return _repository.getMovieDetail(id);
  }
}
