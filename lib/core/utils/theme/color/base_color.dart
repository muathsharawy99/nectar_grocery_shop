import 'package:flutter/material.dart';

abstract class BaseColor {
  // Brand
  Color get primary;
  Color get primaryPressed;
  Color get onPrimary;
  Color get primaryContainer;
  Color get secondary;
  Color get secondaryText;
  Color get secondaryContainer;
  Color get cream;

  // Surfaces
  Color get scaffoldColor;
  Color get surface;
  Color get cardSurface;
  Color get textFieldColor;
  Color get surfaceVariant;
  Color get searchFieldColor;

  // Borders
  Color get borderColor;
  Color get borderLight;
  Color get dividerColor;

  // Text
  Color get defaultTextColor;
  Color get labelText;
  Color get regularText;
  Color get mediumText;
  Color get hintColor;
  Color get mutedTextColor;

  // Status
  Color get errorText;
  Color get errorContainer;
  Color get errorBorderStrong;
  Color get warningText;
  Color get warningContainer;
  Color get infoColor;
  Color get ratingColor;

  // Bottom navigation
  Color get navBarInactiveColor;

  // Overlays & toast
  Color get barrierColor;
  Color get toastColor;
  Color get toastSuccessDot;
  Color get toastErrorDot;

  // Shadows
  Color get buttonShadow;
  Color get toastShadow;

  // Category tiles
  List<Color> get categoryColors;
}
