import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KCustomTextStyle {
  static kBold(BuildContext context, double fontSize, [Color? color]) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color ?? Theme.of(context).textTheme.bodyText1!.color,
    );
  }
}
