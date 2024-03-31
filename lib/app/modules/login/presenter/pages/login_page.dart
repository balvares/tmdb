import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/shared/shared.dart';

import '../controllers/login_controller.dart';
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
              text: "Boas vindas ao TMDB! 😉",
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: layoutSpace32),
            TmdbTextInput(
              labelText: "Usuário",
              controller: controller.userController,
            ),
            const SizedBox(height: layoutSpace16),
            TmdbTextInput(
              labelText: "Senha",
              controller: controller.passwordController,
            ),
            const SizedBox(height: layoutSpace32),
            Center(
              child: TmdbButton(
                label: "Entrar",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
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
