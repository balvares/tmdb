import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app.dart';
import 'app/modules/home/home_binding.dart';
import 'app/core/config/api_configurator.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    await _configureApp();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    runApp(const AppTmdb());
  }, (error, stack) {
    debugPrintStack(label: error.toString(), stackTrace: stack);
  });
}

Future<void> _configureApp() async {
  await ApiConfigurator().configure();
  HomeBinding().dependencies();
}
