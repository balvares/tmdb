import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/shared/shared.dart';

import '../controllers/login_controller.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../../../../../shared/constants/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(layoutSpace16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Boas vindas ao TMDB 😉",
            style: TextStyle(color: TmdbColors.light),
          ),
          TmdbTextInput(
            labelText: loginPageFieldUser,
            controller: controller.userController,
          ),
          const SizedBox(height: layoutSpace16),
          TmdbTextInput(
            labelText: loginPageFieldPassword,
            controller: controller.passwordController,
          ),
          const SizedBox(height: layoutSpace32),
          const TmdbButton(label: loginPageButtonLogin),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TmdbColors.background,
      body: _body(),
    );
  }
}
