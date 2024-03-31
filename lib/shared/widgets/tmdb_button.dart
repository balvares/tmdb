import 'package:flutter/material.dart';

import '../shared.dart';

class TmdbButton extends StatelessWidget {
  const TmdbButton({super.key, required this.label, required this.onPressed});

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: TmdbColors.primary,
      disabledColor: TmdbColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(layoutSpace20),
      ),
      minWidth: MediaQuery.of(context).size.width,
      child: Text(label),
    );
  }
}
