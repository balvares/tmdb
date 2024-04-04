import '../../domain/entities/movie_credits_entity.dart';

abstract interface class MovieCreditsRepository {
  Future<List<MovieCreditsEntity>> getMovieCredits(int id);
}
