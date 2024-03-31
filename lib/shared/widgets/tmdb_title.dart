import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/shared/shared.dart';

class TmdbTitle extends StatelessWidget {
  const TmdbTitle({
    super.key,
    required this.text,
    this.color = TmdbColors.primary,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: layoutSpace16,
      ),
    );
  }
}
