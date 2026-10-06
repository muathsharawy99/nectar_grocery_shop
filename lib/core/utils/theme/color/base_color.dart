import 'package:flutter/material.dart';

abstract class BaseColor {
  // On the dark brand background (splash, onboarding, auth)
  Color get onDarkMuted;
  Color get onDarkSoft;
  Color get onDarkFaint;
  Color get onDarkTrack;
  Color get onDarkCard;
  Color get creamMuted;
  Color get creamSoft;
  Color get creamFaint;
  Color get creamBorder;
  Color get creamStrongBorder;
  Color get creamTrack;
  Color get creamTrackDone;
  Color get creamGlow;
  Color get goldGlow;
  Color get goldGlowSoft;

  // Tinted tiles (onboarding story, bank box, rules)
  Color get goldDark;
  Color get successStrong;
  Color get brandTint;
  Color get successTint;
  Color get bankBoxBorder;

  // Brand
  Color get primary;
  Color get primaryPressed;
  Color get primaryDeep;
  Color get onPrimary;
  Color get secondary;
  Color get secondaryText;
  Color get secondaryContainer;
  Color get secondaryBorder;
  Color get cream;

  // Surfaces
  Color get scaffoldColor;
  Color get surface;
  Color get cardSurface;
  Color get textFieldColor;
  Color get prefixFieldColor;
  Color get surfaceVariant;
  Color get primaryContainer;

  // Borders
  Color get borderColor;
  Color get borderLight;
  Color get borderStrong;
  Color get controlBorder;
  Color get dividerColor;

  // Default text color (applied globally via TextTheme)
  Color get defaultTextColor;

  // Text colors
  Color get boldText;
  Color get labelText;
  Color get regularText;
  Color get mediumText;
  Color get hintColor;
  Color get mutedTextColor;
  Color get infoText;

  // Status
  Color get successText;
  Color get successAccent;
  Color get successContainer;
  Color get successBorder;
  Color get warningText;
  Color get warningContainer;
  Color get errorText;
  Color get errorAccent;
  Color get errorContainer;
  Color get errorBorder;
  Color get errorBorderStrong;
  Color get infoColor;
  Color get infoContainer;
  Color get purple;
  Color get purpleContainer;

  // App bar (green header)
  Color get appBarActionColor;
  Color get appBarSubtitleColor;
  Color get appBarDividerColor;
  Color get notificationDotColor;

  // Controls
  Color get switchOnColor;
  Color get switchOffColor;
  Color get navBarInactiveColor;

  // Dashboard hero card & bottom navigation
  Color get heroDelta;
  Color get heroDeltaContainer;
  Color get chartBar;
  Color get navBarColor;
  Color get unreadCardColor;

  // Overlays & toast
  Color get barrierColor;
  Color get toastColor;
  Color get toastSuccessDot;
  Color get toastErrorDot;

  // Nectar brand extras (social buttons, rating stars, banner card)
  Color get facebookColor;
  Color get googleColor;
  Color get ratingColor;
  Color get searchFieldColor;
  List<Color> get categoryColors;

  // Shadows
  Color get buttonShadow;
  Color get sheetShadow;
  Color get toastShadow;
  Color get cardShadow;
}
