import 'package:flutter/material.dart';

import '../shared.dart';

class TmdbTextInput extends StatelessWidget {
  const TmdbTextInput({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
  });

  final String labelText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Preencha este campo.";
        }
        return null;
      },
      style: const TextStyle(color: TmdbColors.light),
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: TmdbColors.primary),
          floatingLabelStyle: const TextStyle(color: TmdbColors.primary),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: TmdbColors.light),
          ),
          focusColor: TmdbColors.light,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: TmdbColors.light),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: TmdbColors.redError),
          ),
          errorStyle: const TextStyle(
            color: TmdbColors.redError,
          )),
    );
  }
}
