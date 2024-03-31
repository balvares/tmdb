import 'package:flutter/material.dart';

import '../shared.dart';

class TmdbTextInput extends StatelessWidget {
  const TmdbTextInput({
    super.key,
    required this.labelText,
    required this.controller,
  });

  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        focusColor: TmdbColors.light,
        border: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        floatingLabelStyle: const TextStyle(color: TmdbColors.primary),
      ),
    );
  }
}
