import '../../domain/entities/movie_credits_entity.dart';

abstract interface class GetMovieCreditsUsecase {
  Future<List<MovieCreditsEntity>> call(int id);
}
