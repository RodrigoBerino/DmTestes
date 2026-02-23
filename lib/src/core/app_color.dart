import 'package:flutter/material.dart';

abstract class DmColor {
  //black and white
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  //grey
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);
  static const Color gray950 = Color(0xFF212121);
  //apple
  static const Color apple50 = Color(0xFFf1fcf2);
  static const Color apple100 = Color(0XFFdff9e4);
  static const Color apple200 = Color(0XFFc1f1cb);
  static const Color apple300 = Color(0XFF90e5a3);
  static const Color apple400 = Color(0XFF58d073);
  static const Color apple500 = Color(0XFF32b550);
  static const Color apple600 = Color(0XFF28a745);
  static const Color apple700 = Color(0XFF1f7634);
  static const Color apple800 = Color(0XFF1e5d2d);
  static const Color apple900 = Color(0XFF1a4d27);
  static const Color apple950 = Color(0XFF092a12);

  //orange
  static const Color orange50 = Color(0xFFFFF7ED);
  static const Color orange100 = Color(0xFFFFEDD5);
  static const Color orange400 = Color(0xFFFB923C);
  static const Color orange500 = Color(0xFFF97316);
  static const Color orange600 = Color(0xFFEA580C);
  static const Color orange700 = Color(0xFFC2410C);

  //helper
  static const Color success = Color(0xFFC5FDD2);
  static const Color warning = Color(0XFFF9DF98);
  static const Color error = Color(0xFFF998A1);
  static const Color info = Color(0xFF98A6F9);
}

class DmSemanticColor {
  //bg
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTerciary;

  //brand principal
  final Color brandPrimary10;
  final Color brandPrimary50;
  final Color brandPrimary100;

  //bgButton
  final Color backgroundButton;

  //bgButton
  final Color backgroundHeader;

  //text
  final Color textLabel;
  final Color textBody;
  final Color textDisabled;
  final Color textBtn;

  //
  final Color borderPrimary;
  final Color borderSecondary;

  const DmSemanticColor({
    //bg
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTerciary,

    //brand principal
    required this.brandPrimary10,
    required this.brandPrimary50,
    required this.brandPrimary100,

    //bgButton
    required this.backgroundButton,

    //bgAppHeader
    required this.backgroundHeader,

    //text
    required this.textLabel,
    required this.textBody,
    required this.textDisabled,
    required this.textBtn,

    //
    required this.borderPrimary,
    required this.borderSecondary,
  });

  factory DmSemanticColor.light() => const DmSemanticColor(
    //bg
    backgroundPrimary: DmColor.white,
    backgroundSecondary: DmColor.gray100,
    backgroundTerciary: DmColor.gray300,

    //brand principal
    brandPrimary10: DmColor.apple600,
    brandPrimary50: DmColor.apple300,
    brandPrimary100: DmColor.apple200,

    //bgButton
    backgroundButton: DmColor.apple600,

    //bgHeader
    backgroundHeader: DmColor.gray950,

    //text
    textLabel: DmColor.gray900,
    textBody: DmColor.gray700,
    textDisabled: DmColor.gray400,
    textBtn: DmColor.gray50,

    //
    borderPrimary: DmColor.gray200,
    borderSecondary: DmColor.gray100,
  );
}
