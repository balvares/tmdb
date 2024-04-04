import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import '../shared/colors/tmdb_colors.dart';

class AppTmdb extends StatelessWidget {
  const AppTmdb({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Movie Database App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: TmdbColors.primary),
      ),
      getPages: AppPages.pages,
      initialRoute: Routes.home,
    );
  }
}
