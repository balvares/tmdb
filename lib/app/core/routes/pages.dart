import 'package:get/get.dart';

import 'routes.dart';
import '../../modules/home/home_binding.dart';
import '../../modules/login/login_binding.dart';
import '../../modules/home/presenter/pages/home_page.dart';
import '../../modules/login/presenter/pages/login_page.dart';
import '../../modules/movie_detail/movie_detail_binding.dart';
import '../../modules/movie_detail/presenter/pages/movie_detail_page.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.movieDetail,
      page: () => const MovieDetailPage(),
      binding: MovieDetailBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
