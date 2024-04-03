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

  @override
  void initState() {
    super.initState();
    controller.userController.text = 'teste@teste.com';
    controller.passwordController.text = 'teste123';
  }

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
              labelText: "Usuário",
              key: const Key(loginUserKey),
              controller: controller.userController,
            ),
            const SizedBox(height: layoutSpace16),
            TmdbTextInput(
              isPassword: true,
              labelText: "Senha",
              key: const Key(loginPasswordKey),
              controller: controller.passwordController,
            ),
            const SizedBox(height: layoutSpace32),
            Center(
              child: TmdbButton(
                key: const Key(loginButtonKey),
                width: MediaQuery.of(context).size.width,
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
