import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb/shared/constants/keys.dart';
import 'package:tmdb/app/modules/login/presenter/pages/login_page.dart';
import 'package:tmdb/app/modules/login/presenter/controllers/login_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late String userTest;
  late String passwordTest;

  setUpAll(() {
    Get.put(LoginController());
    userTest = "teste@teste.com";
    passwordTest = "teste123";
  });

  testWidgets('LoginPage - Construção da página', (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: LoginPage(),
      ),
    );

    final titleFinder = find.byKey(const Key(loginTitleKey));
    final userFieldFinder = find.byKey(const Key(loginUserKey));
    final passwordFieldFinder = find.byKey(const Key(loginPasswordKey));
    final buttonFinder = find.byKey(const Key(loginButtonKey));

    expect(titleFinder, findsOneWidget);
    expect(userFieldFinder, findsOneWidget);
    expect(passwordFieldFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('LoginPage - Validação de campos vazios',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: LoginPage(),
      ),
    );

    final userFieldFinder = find.byKey(const Key(loginUserKey));
    final passwordFieldFinder = find.byKey(const Key(loginPasswordKey));
    final buttonFinder = find.byKey(const Key(loginButtonKey));

    await tester.tap(buttonFinder);
    await tester.pump();

    expect(find.text('Preencha este campo.'), findsAny);

    await tester.enterText(userFieldFinder, userTest);
    await tester.enterText(passwordFieldFinder, passwordTest);
    await tester.tap(buttonFinder);
    await tester.pump();

    expect(find.text('Preencha este campo.'), findsNothing);
  });

  testWidgets('LoginPage - Validação de campos preenchidos',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: LoginPage(),
      ),
    );

    final userFieldFinder = find.byKey(const Key(loginUserKey));
    final passwordFieldFinder = find.byKey(const Key(loginPasswordKey));
    final buttonFinder = find.byKey(const Key(loginButtonKey));

    await tester.enterText(userFieldFinder, userTest);
    await tester.enterText(passwordFieldFinder, passwordTest);
    await tester.tap(buttonFinder);
    await tester.pump();

    expect(find.text('Preencha este campo.'), findsNothing);
  });
}
