import 'package:get/get.dart';

import '../shared/utils/get_connect_base.dart';
import 'interface/app_configurator.dart';

class ApiConfigurator implements AppConfigurator {
  @override
  Future<void> configure() async {
    Get.put(GetConnectBase());
  }
}
