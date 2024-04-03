import '../../domain/entities/movie_detail_entity.dart';

abstract interface class GetMovieDetailUsecase {
  Future<MovieDetailEntity> call(int id);
}
