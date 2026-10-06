import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/gen/fonts.gen.dart';

import '../utils/theme/color/light_theme_color.dart';

extension ContextExtensions on BuildContext {
  /// Screen height.
  double get h => MediaQuery.sizeOf(this).height;

  /// Height of the status bar.
  double get statusBarHeight => MediaQuery.paddingOf(this).top;

  /// Route arguments passed with `push(..., arg: {...})`.
  Map<dynamic, dynamic> get arg =>
      (ModalRoute.of(this)?.settings.arguments ?? {}) as Map<dynamic, dynamic>;

  bool get isArabic => locale == const Locale('ar');

  /// Poppins for English, IBM Plex Sans Arabic for Arabic.
  String get fontFamily =>
      isArabic ? FontFamily.ibmPlexSansArabic : FontFamily.poppins;

  // --- Named styles (default color = defaultTextColor) ---
  TextStyle _style(FontWeight weight) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: weight,
    height: 1.5,
    color: defaultTextColor,
  );

  TextStyle get light => _style(FontWeight.w300);
  TextStyle get regular => _style(FontWeight.w400);
  TextStyle get medium => _style(FontWeight.w500);
  TextStyle get semiBold => _style(FontWeight.w600);
  TextStyle get bold => _style(FontWeight.w700);

  /// Display font of the promo banner.
  TextStyle get display => TextStyle(
    fontFamily: FontFamily.aclonica,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: defaultTextColor,
  );

  // --- Colors ---
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get onPrimary => LightThemeColor().onPrimary;
  Color get primaryPressed => LightThemeColor().primaryPressed;
  Color get primaryContainer => LightThemeColor().primaryContainer;
  Color get surfacesColor => LightThemeColor().surface;
  Color get cardSurface => LightThemeColor().cardSurface;
  Color get surfaceVariant => LightThemeColor().surfaceVariant;
  Color get searchFieldColor => LightThemeColor().searchFieldColor;
  Color get borderColor => LightThemeColor().borderColor;

  Color get defaultTextColor => LightThemeColor().defaultTextColor;
  Color get labelTextColor => LightThemeColor().labelText;
  Color get regularTextColor => LightThemeColor().regularText;
  Color get mediumTextColor => LightThemeColor().mediumText;
  Color get mutedTextColor => LightThemeColor().mutedTextColor;
  Color get hintColor => LightThemeColor().hintColor;

  Color get errorTextColor => LightThemeColor().errorText;
  Color get errorContainer => LightThemeColor().errorContainer;
  Color get warningColor => LightThemeColor().warningText;
  Color get warningContainer => LightThemeColor().warningContainer;
  Color get ratingColor => LightThemeColor().ratingColor;

  /// Tile color for the category at [index] (cycles through the palette).
  Color categoryColor(int index) {
    final colors = LightThemeColor().categoryColors;
    return colors[index % colors.length];
  }
}
