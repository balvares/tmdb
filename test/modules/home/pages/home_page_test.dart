import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tmdb/shared/constants/keys.dart';
import 'package:tmdb/app/core/shared/enum/state.dart';
import 'package:tmdb/app/modules/home/presenter/pages/home_page.dart';
import 'package:tmdb/app/modules/home/presenter/controllers/home_controller.dart';

import '../../../core/providers/movies/usecases/mock_get_upcoming_movies_usecase.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  late HomeController controller;
  late MockGetPopularMoviesUsecase mockGetPopularMoviesUsecase;
  late MockGetUpcomingMoviesUsecase mockGetUpcomingMoviesUsecase;

  setUpAll(() {
    mockGetPopularMoviesUsecase = MockGetPopularMoviesUsecase();
    mockGetUpcomingMoviesUsecase = MockGetUpcomingMoviesUsecase();
    controller = HomeController(
      getPopularMoviesUsecase: mockGetPopularMoviesUsecase,
      getUpcomingMoviesUsecase: mockGetUpcomingMoviesUsecase,
    );
    controller.state = StateType.success;
    Get.put(controller);
  });

  testWidgets('HomePage - Construção da página em caso de sucesso',
      (WidgetTester tester) async {
    controller.state = StateType.success;
    Get.put(controller);
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomePage(),
      ),
    );

    final appBarFinder = find.byKey(const Key(homeAppBarKey));
    final tabPopularFinder = find.byKey(const Key(homeTabPopularKey));
    final tabUpcomingFinder = find.byKey(const Key(homeTabUpcomingKey));

    expect(appBarFinder, findsOneWidget);
    expect(tabPopularFinder, findsOneWidget);
    expect(tabUpcomingFinder, findsOneWidget);
  });

  testWidgets('HomePage - Construção da página em caso de erro',
      (WidgetTester tester) async {
    controller.state = StateType.error;
    Get.put(controller);
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomePage(),
      ),
    );

    final appBarFinder = find.byKey(const Key(homeAppBarKey));
    final tabPopularFinder = find.byKey(const Key(homeErrorTitleKey));
    final tabUpcomingFinder = find.byKey(const Key(homeErrorSubtitleKey));

    expect(appBarFinder, findsOneWidget);
    expect(tabPopularFinder, findsOneWidget);
    expect(tabUpcomingFinder, findsOneWidget);
  });

  testWidgets('HomePage - Construção da página em caso de loading',
      (WidgetTester tester) async {
    controller.state = StateType.load;
    Get.put(controller);
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomePage(),
      ),
    );

    final loadingFinder = find.byKey(const Key(homeLoadingKey));

    expect(loadingFinder, findsOneWidget);
  });
}
