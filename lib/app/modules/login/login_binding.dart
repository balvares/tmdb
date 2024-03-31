import 'package:get/get.dart';
import 'package:tmdb/app/modules/login/presenter/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
