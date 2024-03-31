import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/shared/shared.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TmdbColors.background,
      body: _body,
    );
  }

  Widget get _body => Padding(
        padding: const EdgeInsets.all(layoutSpace16),
        child: ListView(
          children: [
            TextField(controller: controller.userController),
          ],
        ),
      );
}
