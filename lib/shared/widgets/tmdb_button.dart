import 'package:flutter/material.dart';

import 'widgets.dart';
import '../shared.dart';

class TmdbButton extends StatelessWidget {
  const TmdbButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 50,
    this.fontSize = layoutSpace16,
    this.color = TmdbColors.primary,
    this.fontColor = TmdbColors.dark,
  });

  final String label;
  final Function() onPressed;
  final double width;
  final double fontSize;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      onPressed: onPressed,
      color: color,
      disabledColor: TmdbColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(layoutSpace20),
      ),
      child: TmdbLabel(
        text: label,
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
