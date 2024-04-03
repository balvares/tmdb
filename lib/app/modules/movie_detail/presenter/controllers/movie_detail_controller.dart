import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/app/core/providers/movie_detail/usecases/interfaces/get_movie_detail_usecase.dart';

import '../../../../core/providers/movie_detail/domain/entities/movie_detail_entity.dart';
import '../../../../core/shared/enum/state.dart';
import '../../../../core/shared/errors/http_exception.dart';
import '../../../../core/shared/utils/enviroment.dart';

class MovieDetailController extends GetxController {
  final GetMovieDetailUsecase _getMovieDetailUsecase;

  MovieDetailController({
    required GetMovieDetailUsecase getMovieDetailUsecase,
  }) : _getMovieDetailUsecase = getMovieDetailUsecase;

  final _state = StateType.load.obs;
  get state => _state.value;
  set state(value) => _state.value = value;

  final _movieDetail = Rxn<MovieDetailEntity>(null);
  MovieDetailEntity? get movieDetail => _movieDetail.value;
  set movieDetail(MovieDetailEntity? value) => _movieDetail.value = value;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final imageUrl = Environment.imageUrl;
  late int movieId;
  Map<String, dynamic> params = {};

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
}
