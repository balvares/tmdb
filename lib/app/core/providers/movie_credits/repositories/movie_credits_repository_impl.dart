import 'interfaces/movie_credits_repository.dart';
import '../domain/entities/movie_credits_entity.dart';
import '../datasources/interfaces/movie_credits_datasource.dart';

class MovieCreditsRepositoryImpl implements MovieCreditsRepository {
  final MovieCreditsDatasource _datasource;

  MovieCreditsRepositoryImpl({
    required MovieCreditsDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<List<MovieCreditsEntity>> getMovieCredits(int id) {
    return _datasource.getMovieCredits(id);
  }
}
