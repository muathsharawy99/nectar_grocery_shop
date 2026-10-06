import 'package:flutter/material.dart';

import 'base_color.dart';

/// Nectar palette (green #53B175, accent red #F3603F, greys from the design).
class LightThemeColor extends BaseColor {
  // ── Brand
  @override
  Color get primary => const Color(0xFF53B175);
  @override
  Color get primaryPressed => const Color(0xFF489E67);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);
  @override
  Color get primaryContainer => const Color(0xFFEEF7F1);
  @override
  Color get secondary => const Color(0xFFF3603F);
  @override
  Color get secondaryText => const Color(0xFFD14B2D);
  @override
  Color get secondaryContainer => const Color(0xFFFDEFEB);
  @override
  Color get cream => const Color(0xFFF2F3F2);

  // ── Surfaces
  @override
  Color get scaffoldColor => const Color(0xFFFFFFFF);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get cardSurface => const Color(0xFFFFFFFF);
  @override
  Color get textFieldColor => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFFF2F3F2);
  @override
  Color get searchFieldColor => const Color(0xFFF2F3F2);

  // ── Borders
  @override
  Color get borderColor => const Color(0xFFE2E2E2);
  @override
  Color get borderLight => const Color(0xFFF2F3F2);
  @override
  Color get dividerColor => const Color(0xFFE2E2E2);

  // ── Text
  @override
  Color get defaultTextColor => const Color(0xFF181725);
  @override
  Color get labelText => const Color(0xFF7C7C7C);
  @override
  Color get regularText => const Color(0xFF4C4F4D);
  @override
  Color get mediumText => const Color(0xFF7C7C7C);
  @override
  Color get hintColor => const Color(0xFF7C7C7C);
  @override
  Color get mutedTextColor => const Color(0xFFB1B1B1);

  // ── Status
  @override
  Color get errorText => const Color(0xFFF3603F);
  @override
  Color get errorContainer => const Color(0xFFFDEFEB);
  @override
  Color get errorBorderStrong => const Color(0xFFF7A28E);
  @override
  Color get warningText => const Color(0xFFF8A44C);
  @override
  Color get warningContainer => const Color(0xFFFEF4E9);
  @override
  Color get infoColor => const Color(0xFF53B175);
  @override
  Color get ratingColor => const Color(0xFFF3603F);

  // ── Bottom navigation
  @override
  Color get navBarInactiveColor => const Color(0xFF181725);

  // ── Overlays & toast
  @override
  Color get barrierColor => const Color(0x6B181725);
  @override
  Color get toastColor => const Color(0xFF181725);
  @override
  Color get toastSuccessDot => const Color(0xFF53B175);
  @override
  Color get toastErrorDot => const Color(0xFFF3603F);

  // ── Shadows
  @override
  Color get buttonShadow => const Color(0x2953B175);
  @override
  Color get toastShadow => const Color(0x4D181725);

  /// Category tiles cycle through these (tinted backgrounds + borders).
  @override
  List<Color> get categoryColors => const [
    Color(0xFF53B175),
    Color(0xFFF8A44C),
    Color(0xFFF7A593),
    Color(0xFFD3B0E0),
    Color(0xFFFDE598),
    Color(0xFFB7DFF5),
  ];
}
