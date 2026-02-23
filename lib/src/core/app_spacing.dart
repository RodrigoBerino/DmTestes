import 'package:flutter/widgets.dart';

abstract class AppSpacing {
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double sm = 12.0;
  static const double m = 16.0;
  static const double ml = 20.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;
  static const double xxxl = 48.0;
  static const double huge = 64.0;
  static const double giant = 80.0;

  //passando tokens de espaçamanento padrão
  static const EdgeInsets paddingAllM = EdgeInsets.all(m);
  static const EdgeInsets paddingAllL = EdgeInsets.all(l);
  static const EdgeInsets paddingHorizontalM = EdgeInsets.symmetric(
    horizontal: m,
  );
}
