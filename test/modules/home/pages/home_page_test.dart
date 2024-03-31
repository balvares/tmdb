import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb/shared/constants/keys.dart';
import 'package:tmdb/app/modules/login/presenter/pages/login_page.dart';
import 'package:tmdb/app/modules/login/presenter/controllers/login_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    Get.put(LoginController());
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

    // Deixe os campos de usuário e senha vazios e pressione o botão de login
    await tester.tap(buttonFinder);
    await tester.pump();

    // Verifique se as mensagens de erro corretas são exibidas
    expect(find.text('Preencha este campo.'), findsAny);

    // Digite um nome de usuário e senha válidos e verifique se nenhuma mensagem de erro é exibida
    await tester.enterText(userFieldFinder, 'usuário válido');
    await tester.enterText(passwordFieldFinder, 'senha válida');
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

    // Deixe os campos de usuário e senha vazios e pressione o botão de login
    await tester.enterText(userFieldFinder, 'teste@teste.com');
    await tester.enterText(passwordFieldFinder, 'teste123');
    await tester.tap(buttonFinder);
    await tester.pump();

    // Verifique se as mensagens de erro corretas são exibidas
    expect(find.text('Preencha este campo.'), findsNothing);
  });
}
