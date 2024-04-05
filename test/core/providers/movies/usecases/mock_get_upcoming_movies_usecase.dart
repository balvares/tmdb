import 'package:mockito/mockito.dart';
import 'package:tmdb/app/core/providers/movies/usecases/interfaces/get_popular_movies_usecase.dart';
import 'package:tmdb/app/core/providers/movies/usecases/interfaces/get_upcoming_movies_usecase.dart';

class MockGetPopularMoviesUsecase extends Mock
    implements GetPopularMoviesUsecase {}

class MockGetUpcomingMoviesUsecase extends Mock
    implements GetUpcomingMoviesUsecase {}
