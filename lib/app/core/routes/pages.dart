import 'package:get/get.dart';

import 'routes.dart';
import '../../modules/login/login_binding.dart';
import '../../modules/login/presenter/pages/login_page.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
