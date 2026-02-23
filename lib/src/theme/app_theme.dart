import 'package:flutter/material.dart';
import 'package:dmtestes/src/core/app_color.dart';
import 'package:dmtestes/src/core/app_type.dart';

class AppTheme {
  static final DmSemanticColor _colors = DmSemanticColor.light();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // ======================
    // COLOR SCHEME
    // ======================
    scaffoldBackgroundColor: _colors.backgroundPrimary,
    primaryColor: _colors.brandPrimary10,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _colors.brandPrimary10,
      onPrimary: _colors.textBtn,
      secondary: _colors.brandPrimary50,
      onSecondary: _colors.textLabel,
      error: DmColor.error,
      onError: DmColor.white,
      surface: _colors.backgroundSecondary,
      onSurface: _colors.textLabel,
      background: _colors.backgroundPrimary,
      onBackground: _colors.textBody,
    ),

    // ======================
    // APP BAR
    // ======================
    appBarTheme: AppBarTheme(
      backgroundColor: _colors.backgroundHeader,
      foregroundColor: DmColor.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.h3.copyWith(color: DmColor.white),
    ),

    // ======================
    // TEXT THEME
    // ======================
    textTheme: TextTheme(
      displayLarge: AppTypography.h1,
      displayMedium: AppTypography.h2,
      displaySmall: AppTypography.h3,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
    ),

    // ======================
    // ELEVATED BUTTON
    // ======================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colors.backgroundButton,
        foregroundColor: _colors.textBtn,
        disabledBackgroundColor: _colors.backgroundTerciary,
        disabledForegroundColor: _colors.textDisabled,
        textStyle: AppTypography.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
    ),

    // ======================
    // OUTLINED BUTTON
    // ======================
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _colors.brandPrimary10,
        side: BorderSide(color: _colors.borderPrimary),
        textStyle: AppTypography.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // ======================
    // INPUT DECORATION
    // ======================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _colors.backgroundSecondary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _colors.borderPrimary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _colors.borderPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _colors.brandPrimary10, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: DmColor.error),
      ),
      labelStyle: AppTypography.bodySmall.copyWith(color: _colors.textBody),
    ),

    // ======================
    // DIVIDER
    // ======================
    dividerTheme: DividerThemeData(
      color: _colors.borderSecondary,
      thickness: 1,
    ),
  );
}
