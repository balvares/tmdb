import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/login_controller.dart';
import '../../../../../shared/constants/keys.dart';
import '../../../../../shared/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<LoginController>();

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(layoutSpace16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TmdbTitle(
              key: Key(loginTitleKey),
              text: "Boas vindas ao TMDB! 😉",
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: layoutSpace32),
            TmdbTextInput(
              key: const Key(loginUserKey),
              labelText: "Usuário",
              controller: controller.userController,
            ),
            const SizedBox(height: layoutSpace16),
            TmdbTextInput(
              key: const Key(loginPasswordKey),
              labelText: "Senha",
              controller: controller.passwordController,
            ),
            const SizedBox(height: layoutSpace32),
            Center(
              child: TmdbButton(
                key: const Key(loginButtonKey),
                label: "Entrar",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(Routes.home);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: TmdbColors.background,
    );
  }
}
