import 'package:get/get.dart';
import 'package:tmdb/app/modules/home/presenter/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
