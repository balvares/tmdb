import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/enum/state.dart';
import '../../../../core/shared/utils/enviroment.dart';
import '../../../../core/providers/movies/domain/entities/movie_entity.dart';
import '../../../../core/providers/movies/usecases/interfaces/get_popular_movies_usecase.dart';
import '../../../../core/providers/movies/usecases/interfaces/get_upcoming_movies_usecase.dart';

class HomeController extends GetxController {
  final GetPopularMoviesUsecase _getPopularMoviesUsecase;
  final GetUpcomingMoviesUsecase _getUpcomingMoviesUsecase;

  HomeController({
    required GetPopularMoviesUsecase getPopularMoviesUsecase,
    required GetUpcomingMoviesUsecase getUpcomingMoviesUsecase,
  })  : _getPopularMoviesUsecase = getPopularMoviesUsecase,
        _getUpcomingMoviesUsecase = getUpcomingMoviesUsecase;

  final _state = StateType.load.obs;
  get state => _state.value;
  set state(value) => _state.value = value;

  final _popularMovies = Rxn<MovieEntity>(null);
  MovieEntity? get popularMovies => _popularMovies.value;
  set popularMovies(MovieEntity? value) => _popularMovies.value = value;

  final _upcomingMovies = Rxn<MovieEntity>(null);
  MovieEntity? get upcomingMovies => _upcomingMovies.value;
  set upcomingMovies(MovieEntity? value) => _upcomingMovies.value = value;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final imageUrl = Environment.imageUrl;
  final double fontSize = 10;

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  void fetchData() async {
    await _getPopularMovies();
    await _getUpcomingMovies();
  }

  Future<void> _getPopularMovies() async {
    try {
      state = StateType.load;
      popularMovies = await _getPopularMoviesUsecase.call();
      state = StateType.success;
    } catch (e) {
      state = StateType.error;
    }
  }

  Future<void> _getUpcomingMovies() async {
    try {
      state = StateType.load;
      upcomingMovies = await _getUpcomingMoviesUsecase.call();
      state = StateType.success;
    } catch (e) {
      state = StateType.error;
    }
  }
}
