import 'package:get/get.dart';

import 'presenter/controllers/home_controller.dart';
import '../../core/providers/movies/datasources/movie_datasource_impl.dart';
import '../../core/providers/movies/repositories/movie_repository_impl.dart';
import '../../core/providers/movies/usecases/get_popular_movies_usecase_impl.dart';
import '../../core/providers/movies/usecases/get_upcoming_movies_usecase_impl.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MovieDatasourceImpl(
        getConnect: Get.find(),
      ),
    );
    Get.lazyPut(
      () => MovieRepositoryImpl(
        datasource: Get.find<MovieDatasourceImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetPopularMoviesUsecaseImpl(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );

    Get.lazyPut(
      () => GetUpcomingMoviesUsecaseImpl(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );

    Get.put(HomeController(
      getPopularMoviesUsecase: Get.find<GetPopularMoviesUsecaseImpl>(),
      getUpcomingMoviesUsecase: Get.find<GetUpcomingMoviesUsecaseImpl>(),
    ));
  }
}
