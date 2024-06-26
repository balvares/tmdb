import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled() {
    return userController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }
}
