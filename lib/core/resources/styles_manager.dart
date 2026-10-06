import 'package:flutter/material.dart';

import '../utils/theme/color/light_theme_color.dart';

class ShadowStyles {
  /// Primary button: `0 10px 26px rgba(20,51,44,.26)`.
  static List<BoxShadow> get button => [
    BoxShadow(
      color: LightThemeColor().buttonShadow,
      offset: const Offset(0, 10),
      blurRadius: 26,
    ),
  ];

  /// Bottom sheets: `0 -16px 40px rgba(11,26,23,.18)`.
  static List<BoxShadow> get sheet => [
    BoxShadow(
      color: LightThemeColor().sheetShadow,
      offset: const Offset(0, -16),
      blurRadius: 40,
    ),
  ];

  /// Toasts: `0 12px 30px rgba(11,26,23,.3)`.
  static List<BoxShadow> get toast => [
    BoxShadow(
      color: LightThemeColor().toastShadow,
      offset: const Offset(0, 12),
      blurRadius: 30,
    ),
  ];

  /// Floating cards on dark backgrounds: `0 18px 40px rgba(11,26,23,.22)`.
  static List<BoxShadow> get floatingCard => [
    BoxShadow(
      color: LightThemeColor().cardShadow,
      offset: const Offset(0, 18),
      blurRadius: 40,
    ),
  ];
}

class GradientStyles {
  /// Brand green gradient (headers, hero cards).
  static Gradient get linearGradient => LinearGradient(
    colors: [LightThemeColor().primary, LightThemeColor().primaryDeep],
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
  );
}
