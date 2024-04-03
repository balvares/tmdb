import 'package:get/get.dart';

import 'presenter/controllers/movie_detail_controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailController());
  }
}
