import 'interfaces/movie_repository.dart';
import '../domain/entities/movie_entity.dart';
import '../datasources/interfaces/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource _datasource;

  MovieRepositoryImpl({
    required MovieDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<MovieEntity> getPopularMovies() async {
    return _datasource.getPopularMovies();
  }

  @override
  Future<MovieEntity> getUpcomingMovies() async {
    // MovieEntity upcomingMoviesRaw;
    // upcomingMoviesRaw = await _datasource.getUpcomingMovies();

    // MovieEntity upcomingMoviesTreated;
    // upcomingMoviesTreated = MovieEntity(
    //   page: upcomingMoviesRaw.page,
    //   totalPages: upcomingMoviesRaw.totalPages,
    //   totalResults: upcomingMoviesRaw.totalResults,
    //   result: upcomingMoviesRaw.result
    //       .where((movie) => movie.releaseDate.isAfter(DateTime.now()))
    //       .toList(),
    // );

    // return upcomingMoviesTreated;
    return _datasource.getUpcomingMovies();
  }
}
