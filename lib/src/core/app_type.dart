import 'package:dmtestes/src/core/app_color.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  static TextStyle get _baseStyle =>
      GoogleFonts.inter(color: DmSemanticColor.light().textLabel);

  //Heading
  static TextStyle h1 = _baseStyle.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    letterSpacing: 0,
  );

  static TextStyle h2 = _baseStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  static TextStyle h3 = _baseStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    letterSpacing: 0,
  );

  static TextStyle bodyLarge = _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyMedium = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySmall = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
