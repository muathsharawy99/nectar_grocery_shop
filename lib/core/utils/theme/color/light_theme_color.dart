import 'package:flutter/material.dart';

import 'base_color.dart';

/// Nectar palette (green #53B175, accent red #F3603F, greys from the design).
/// The getter names are shared with the other apps' structure so the core
/// widgets work as-is.
class LightThemeColor extends BaseColor {
  // ── On the green brand background (splash, onboarding)
  @override
  Color get onDarkMuted => const Color(0x9EFFFFFF);
  @override
  Color get onDarkSoft => const Color(0xB3FFFFFF);
  @override
  Color get onDarkFaint => const Color(0x1FFFFFFF);
  @override
  Color get onDarkTrack => const Color(0x2EFFFFFF);
  @override
  Color get onDarkCard => const Color(0x14FFFFFF);
  @override
  Color get creamMuted => const Color(0x9EF2F3F2);
  @override
  Color get creamSoft => const Color(0x8CF2F3F2);
  @override
  Color get creamFaint => const Color(0x0FF2F3F2);
  @override
  Color get creamBorder => const Color(0x24F2F3F2);
  @override
  Color get creamStrongBorder => const Color(0x59F2F3F2);
  @override
  Color get creamTrack => const Color(0x2EF2F3F2);
  @override
  Color get creamTrackDone => const Color(0x73F2F3F2);
  @override
  Color get creamGlow => const Color(0x17F2F3F2);
  @override
  Color get goldGlow => const Color(0x29F8A44C);
  @override
  Color get goldGlowSoft => const Color(0x21F8A44C);

  @override
  Color get goldDark => const Color(0xFF8A5A1E);
  @override
  Color get successStrong => const Color(0xFF3F9A61);
  @override
  Color get brandTint => const Color(0xFFE5F4EA);
  @override
  Color get successTint => const Color(0xFFDDF0E3);
  @override
  Color get bankBoxBorder => const Color(0xFFE2E2E2);

  // ── Brand
  @override
  Color get primary => const Color(0xFF53B175);
  @override
  Color get primaryPressed => const Color(0xFF489E67);
  @override
  Color get primaryDeep => const Color(0xFF3F9A61);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);
  @override
  Color get secondary => const Color(0xFFF3603F);
  @override
  Color get secondaryText => const Color(0xFFD14B2D);
  @override
  Color get secondaryContainer => const Color(0xFFFDEFEB);
  @override
  Color get secondaryBorder => const Color(0xFFF9C9BD);
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
  Color get prefixFieldColor => const Color(0xFFF2F3F2);
  @override
  Color get surfaceVariant => const Color(0xFFF2F3F2);
  @override
  Color get primaryContainer => const Color(0xFFEEF7F1);

  // ── Borders
  @override
  Color get borderColor => const Color(0xFFE2E2E2);
  @override
  Color get borderLight => const Color(0xFFF2F3F2);
  @override
  Color get borderStrong => const Color(0xFFB3B3B3);
  @override
  Color get controlBorder => const Color(0xFFD3D3D3);
  @override
  Color get dividerColor => const Color(0xFFE2E2E2);

  @override
  Color get defaultTextColor => const Color(0xFF181725);

  // ── Text
  @override
  Color get boldText => const Color(0xFF181725);
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
  @override
  Color get infoText => const Color(0xFF7C7C7C);

  // ── Status
  @override
  Color get successText => const Color(0xFF53B175);
  @override
  Color get successAccent => const Color(0xFF53B175);
  @override
  Color get successContainer => const Color(0xFFEEF7F1);
  @override
  Color get successBorder => const Color(0xFFB7DFC5);
  @override
  Color get warningText => const Color(0xFFF8A44C);
  @override
  Color get warningContainer => const Color(0xFFFEF4E9);
  @override
  Color get errorText => const Color(0xFFF3603F);
  @override
  Color get errorAccent => const Color(0xFFF3603F);
  @override
  Color get errorContainer => const Color(0xFFFDEFEB);
  @override
  Color get errorBorder => const Color(0xFFFBD9D1);
  @override
  Color get errorBorderStrong => const Color(0xFFF7A28E);
  @override
  Color get infoColor => const Color(0xFF53B175);
  @override
  Color get infoContainer => const Color(0xFFEEF7F1);
  @override
  Color get purple => const Color(0xFFD3B0E0);
  @override
  Color get purpleContainer => const Color(0xFFF4EAF8);

  // ── App bar
  @override
  Color get appBarActionColor => const Color(0x24FFFFFF);
  @override
  Color get appBarSubtitleColor => const Color(0xBFFFFFFF);
  @override
  Color get appBarDividerColor => const Color(0x14FFFFFF);
  @override
  Color get notificationDotColor => const Color(0xFFF3603F);

  // ── Controls
  @override
  Color get switchOnColor => const Color(0xFF53B175);
  @override
  Color get switchOffColor => const Color(0xFFE2E2E2);
  @override
  Color get navBarInactiveColor => const Color(0xFF181725);

  @override
  Color get heroDelta => const Color(0xFF53B175);
  @override
  Color get heroDeltaContainer => const Color(0x2453B175);
  @override
  Color get chartBar => const Color(0x47FFFFFF);
  @override
  Color get navBarColor => const Color(0xFFFFFFFF);
  @override
  Color get unreadCardColor => const Color(0xFFF2F3F2);

  // ── Overlays & toast
  @override
  Color get barrierColor => const Color(0x6B181725);
  @override
  Color get toastColor => const Color(0xFF181725);
  @override
  Color get toastSuccessDot => const Color(0xFF53B175);
  @override
  Color get toastErrorDot => const Color(0xFFF3603F);

  // ── Nectar extras
  @override
  Color get facebookColor => const Color(0xFF4A66AC);
  @override
  Color get googleColor => const Color(0xFF5383EC);
  @override
  Color get ratingColor => const Color(0xFFF3603F);
  @override
  Color get searchFieldColor => const Color(0xFFF2F3F2);

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

  // ── Shadows
  @override
  Color get buttonShadow => const Color(0x2953B175);
  @override
  Color get sheetShadow => const Color(0x2E181725);
  @override
  Color get toastShadow => const Color(0x4D181725);
  @override
  Color get cardShadow => const Color(0x1F181725);
}
