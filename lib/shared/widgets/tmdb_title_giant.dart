import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared.dart';

class TmdbTitleGiant extends StatelessWidget {
  const TmdbTitleGiant({
    super.key,
    required this.text,
    this.fontSize = layoutSpace24,
    this.textAlign = TextAlign.start,
    this.color = TmdbColors.secondary,
    this.fontWeight = FontWeight.bold,
  });

  final String text;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      softWrap: true,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
