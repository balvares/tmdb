import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/enum/state.dart';
import '../../../../core/shared/utils/enviroment.dart';
import '../../../../core/shared/errors/http_exception.dart';
import '../../../../core/providers/movie_detail/domain/entities/movie_detail_entity.dart';
import '../../../../core/providers/movie_credits/domain/entities/movie_credits_entity.dart';
import '../../../../core/providers/movie_detail/usecases/interfaces/get_movie_detail_usecase.dart';
import '../../../../core/providers/movie_credits/usecases/interfaces/get_movie_credits_usecase.dart';

class MovieDetailController extends GetxController {
  final GetMovieDetailUsecase _getMovieDetailUsecase;
  final GetMovieCreditsUsecase _getMovieCreditsUsecase;

  MovieDetailController({
    required GetMovieDetailUsecase getMovieDetailUsecase,
    required GetMovieCreditsUsecase getMovieCreditsUsecase,
  })  : _getMovieDetailUsecase = getMovieDetailUsecase,
        _getMovieCreditsUsecase = getMovieCreditsUsecase;

  final _state = StateType.load.obs;
  get state => _state.value;
  set state(value) => _state.value = value;

  final _movieDetail = Rxn<MovieDetailEntity>(null);
  MovieDetailEntity? get movieDetail => _movieDetail.value;
  set movieDetail(MovieDetailEntity? value) => _movieDetail.value = value;

  final _movieCredits = Rxn<List<MovieCreditsEntity>>(null);
  List<MovieCreditsEntity>? get movieCredits => _movieCredits.value;
  set movieCredits(List<MovieCreditsEntity>? value) =>
      _movieCredits.value = value;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final imageUrl = Environment.imageUrl;
  late int movieId;
  Map<String, dynamic> params = {};
  final minRatingValue = 1.0.obs;

  final List<String> genreList = [];

  @override
  void onReady() {
    params = Get.parameters;
    movieId = int.parse(params['id']);
    fetchData();
    super.onReady();
  }

  void fetchData() async {
    await _getMovieDetail();
    for (var genre in movieDetail!.genres) {
      genreList.add(genre['name']);
    }
    await _getMovieCredits();
  }

  Future<void> _getMovieDetail() async {
    try {
      state = StateType.load;
      movieDetail = await _getMovieDetailUsecase.call(movieId);
      state = StateType.success;
    } catch (e) {
      state = StateType.error;
      var message = "";
      if (e is HttpException) {
        message = "Não foi possivel carregar os dados.";
      } else {
        message = "Ocorreu um problema, tente novamente mais tarde.";
      }
      Get.snackbar("Ops!", message);
    }
  }

  Future<void> _getMovieCredits() async {
    try {
      state = StateType.load;
      movieCredits = await _getMovieCreditsUsecase.call(movieId);
      state = StateType.success;
    } catch (e) {
      state = StateType.error;
      var message = "";
      if (e is HttpException) {
        message = "Não foi possivel carregar os dados.";
      } else {
        message = "Ocorreu um problema, tente novamente mais tarde.";
      }
      Get.snackbar("Ops!", message);
    }
  }
}
