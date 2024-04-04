import '../../domain/entities/movie_credits_entity.dart';

abstract interface class MovieCreditsDatasource {
  Future<List<MovieCreditsEntity>> getMovieCredits(int id);
}