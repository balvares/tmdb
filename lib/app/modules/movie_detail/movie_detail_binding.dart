import 'package:get/get.dart';

import 'presenter/controllers/movie_detail_controller.dart';
import '../../core/providers/movie_detail/usecases/get_movie_detail_usecase_impl.dart';
import '../../core/providers/movie_credits/usecases/get_movie_credits_usecase_impl.dart';
import '../../core/providers/movie_detail/datasources/movie_detail_datasource_impl.dart';
import '../../core/providers/movie_detail/repositories/movie_detail_repository_impl.dart';
import '../../core/providers/movie_credits/datasources/movie_credits_datasource_impl.dart';
import '../../core/providers/movie_credits/repositories/movie_credits_repository_impl.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MovieDetailDatasourceImpl(
        getConnect: Get.find(),
      ),
    );
    Get.lazyPut(
      () => MovieDetailRepositoryImpl(
        datasource: Get.find<MovieDetailDatasourceImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetMovieDetailUsecaseImpl(
        repository: Get.find<MovieDetailRepositoryImpl>(),
      ),
    );

    Get.lazyPut(
      () => MovieCreditsDatasourceImpl(
        getConnect: Get.find(),
      ),
    );
    Get.lazyPut(
      () => MovieCreditsRepositoryImpl(
        datasource: Get.find<MovieCreditsDatasourceImpl>(),
      ),
    );

    Get.lazyPut(
      () => GetMovieCreditsUsecaseImpl(
        repository: Get.find<MovieCreditsRepositoryImpl>(),
      ),
    );

    Get.put(MovieDetailController(
        getMovieDetailUsecase: Get.find<GetMovieDetailUsecaseImpl>(),
        getMovieCreditsUsecase: Get.find<GetMovieCreditsUsecaseImpl>()));
  }
}
