import 'package:flutter/material.dart';
import 'package:tmdb/shared/shared.dart';

class TmdbButton extends StatelessWidget {
  const TmdbButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: TmdbColors.primary,
      disabledColor: TmdbColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(layoutSpace20),
      ),
      child: Text(label),
    );
  }
}
