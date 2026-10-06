import 'package:flutter/material.dart';

class FontWeightManager {
  const FontWeightManager._();
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

/// Design font sizes. Never add `.sp`: text is scaled once in `main.dart`
/// through `TextScaler.linear(1.sp)`.
class FontSize {
  const FontSize._();

  static const double s9_5 = 9.5;
  static const double s10 = 10.0;
  static const double s10_5 = 10.5;
  static const double s11 = 11.0;
  static const double s11_5 = 11.5;
  static const double s12 = 12.0;
  static const double s12_5 = 12.5;
  static const double s13 = 13.0;
  static const double s13_5 = 13.5;
  static const double s14 = 14.0;
  static const double s14_5 = 14.5;
  static const double s15 = 15.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s19 = 19.0;
  static const double s20 = 20.0;
  static const double s23 = 23.0;
  static const double s24 = 24.0;
  static const double s25 = 25.0;
  static const double s27 = 27.0;
  static const double s29 = 29.0;
  static const double s22 = 22.0;
  static const double s31 = 31.0;
  static const double s35 = 35.0;
}
