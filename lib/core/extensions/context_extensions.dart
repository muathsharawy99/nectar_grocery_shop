import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/gen/fonts.gen.dart';

import '../utils/theme/color/light_theme_color.dart';

double tabletBreakpointGlobal = 600.0;
double desktopBreakpointGlobal = 720.0;

// Context Extensions
extension ContextExtensions on BuildContext {
  double get h => MediaQuery.sizeOf(this).height;
  double get w => MediaQuery.sizeOf(this).width;

  /// return screen size
  Size size() => MediaQuery.sizeOf(this);

  /// return screen width
  double width() => MediaQuery.sizeOf(this).width;

  /// return screen height
  double height() => MediaQuery.sizeOf(this).height;

  /// return screen devicePixelRatio
  double pixelRatio() => MediaQuery.devicePixelRatioOf(this);

  /// returns brightness
  Brightness platformBrightness() => MediaQuery.platformBrightnessOf(this);

  /// Return the height of status bar
  double get statusBarHeight => MediaQuery.paddingOf(this).top;

  /// Return the height of navigation bar
  double get navigationBarHeight => MediaQuery.paddingOf(this).bottom;

  /// Returns Theme.of(context)
  ThemeData get theme => Theme.of(this);

  /// Returns Theme.of(context).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns DefaultTextStyle.of(context)
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// Returns Form.of(context)
  FormState? get formState => Form.of(this);

  /// Returns Scaffold.of(context)
  ScaffoldState get scaffoldState => Scaffold.of(this);

  /// Returns Overlay.of(context)
  OverlayState? get overlayState => Overlay.of(this);

  /// Poppins for English, IBM Plex Sans Arabic for Arabic.
  String get fontFamily =>
      isArabic ? FontFamily.ibmPlexSansArabic : FontFamily.poppins;

  // --- Named styles (default color = defaultTextColor) ---
  TextStyle get light => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    height: 1.5,
    color: defaultTextColor,
  );
  TextStyle get regular => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: defaultTextColor,
  );
  TextStyle get medium => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: defaultTextColor,
  );
  TextStyle get semiBold => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: defaultTextColor,
  );
  TextStyle get bold => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: defaultTextColor,
  );

  /// Display font of the promo banner.
  TextStyle get display => TextStyle(
    fontFamily: FontFamily.aclonica,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: defaultTextColor,
  );

  TextStyle get boldText =>
      Theme.of(this).textTheme.titleLarge ?? const TextStyle();

  TextStyle get lightText =>
      Theme.of(this).textTheme.bodySmall ?? const TextStyle();

  TextStyle get mediumText =>
      Theme.of(this).textTheme.labelMedium ?? const TextStyle();
  TextStyle get mediumBody =>
      Theme.of(this).textTheme.bodyMedium ?? const TextStyle();

  TextStyle get regularText =>
      Theme.of(this).textTheme.titleSmall ?? const TextStyle();

  TextStyle get semiboldText =>
      Theme.of(this).textTheme.titleMedium ?? const TextStyle();

  /// Returns primaryColor Color
  Color get primaryColor => theme.primaryColor;
  Color get onPrimary => theme.colorScheme.onPrimary;
  Color get hintColor => theme.hintColor;
  Color get primaryContainer => theme.colorScheme.primaryContainer;

  /// Returns accentColor Color (red)
  Color get secondaryColor => theme.colorScheme.secondary;

  /// Returns scaffoldBackgroundColor Color
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// Returns errorColor Color
  Color get errorColor => theme.colorScheme.error;
  Color get surfacesColor => theme.colorScheme.surface;
  Color get onSurface => theme.colorScheme.onSurface;
  Color get outline => theme.colorScheme.outline;

  // --- On the green brand background (splash, onboarding) ---
  Color get onDarkMuted => LightThemeColor().onDarkMuted;
  Color get onDarkSoft => LightThemeColor().onDarkSoft;
  Color get onDarkFaint => LightThemeColor().onDarkFaint;
  Color get onDarkTrack => LightThemeColor().onDarkTrack;
  Color get onDarkCard => LightThemeColor().onDarkCard;
  Color get creamMuted => LightThemeColor().creamMuted;
  Color get creamSoft => LightThemeColor().creamSoft;
  Color get creamFaint => LightThemeColor().creamFaint;
  Color get creamBorder => LightThemeColor().creamBorder;
  Color get creamStrongBorder => LightThemeColor().creamStrongBorder;
  Color get creamTrack => LightThemeColor().creamTrack;
  Color get creamTrackDone => LightThemeColor().creamTrackDone;
  Color get goldGlow => LightThemeColor().goldGlow;
  Color get goldDark => LightThemeColor().goldDark;
  Color get successStrong => LightThemeColor().successStrong;
  Color get brandTint => LightThemeColor().brandTint;
  Color get successTint => LightThemeColor().successTint;
  Color get bankBoxBorder => LightThemeColor().bankBoxBorder;
  Color get toastSuccessDot => LightThemeColor().toastSuccessDot;

  // --- Nectar extras ---
  Color get facebookColor => LightThemeColor().facebookColor;
  Color get googleColor => LightThemeColor().googleColor;
  Color get ratingColor => LightThemeColor().ratingColor;
  Color get searchFieldColor => LightThemeColor().searchFieldColor;

  /// Tile color for the category at [index] (cycles through the palette).
  Color categoryColor(int index) {
    final colors = LightThemeColor().categoryColors;
    return colors[index % colors.length];
  }

  // --- Semantic colors ---
  Color get primaryPressed => LightThemeColor().primaryPressed;
  Color get primaryDeep => LightThemeColor().primaryDeep;
  Color get secondaryText => LightThemeColor().secondaryText;
  Color get secondaryContainer => LightThemeColor().secondaryContainer;
  Color get creamColor => LightThemeColor().cream;

  Color get cardSurface => LightThemeColor().cardSurface;
  Color get surfaceVariant => LightThemeColor().surfaceVariant;
  Color get textFieldColor => LightThemeColor().textFieldColor;
  Color get prefixFieldColor => LightThemeColor().prefixFieldColor;

  Color get borderColor => LightThemeColor().borderColor;
  Color get borderLightColor => LightThemeColor().borderLight;
  Color get borderStrongColor => LightThemeColor().borderStrong;
  Color get controlBorderColor => LightThemeColor().controlBorder;
  Color get dividerColor => LightThemeColor().dividerColor;

  Color get defaultTextColor => LightThemeColor().defaultTextColor;
  Color get boldTextColor => LightThemeColor().boldText;
  Color get labelTextColor => LightThemeColor().labelText;
  Color get regularTextColor => LightThemeColor().regularText;
  Color get mediumTextColor => LightThemeColor().mediumText;
  Color get mutedTextColor => LightThemeColor().mutedTextColor;
  Color get infoTextColor => LightThemeColor().infoText;

  Color get successColor => LightThemeColor().successText;
  Color get successAccent => LightThemeColor().successAccent;
  Color get successBorderColor => LightThemeColor().successBorder;
  Color get successContainer => LightThemeColor().successContainer;
  Color get warningColor => LightThemeColor().warningText;
  Color get warningContainer => LightThemeColor().warningContainer;
  Color get errorTextColor => LightThemeColor().errorText;
  Color get errorContainer => LightThemeColor().errorContainer;
  Color get infoColor => LightThemeColor().infoColor;
  Color get infoContainer => LightThemeColor().infoContainer;

  Color get notificationDotColor => LightThemeColor().notificationDotColor;
  Color get navBarInactiveColor => LightThemeColor().navBarInactiveColor;
  Color get navBarColor => LightThemeColor().navBarColor;
  Color get unreadCardColor => LightThemeColor().unreadCardColor;
  Color get errorAccent => LightThemeColor().errorAccent;
  Color get errorBorderColor => LightThemeColor().errorBorder;
  Color get secondaryBorderColor => LightThemeColor().secondaryBorder;
  Color get purpleColor => LightThemeColor().purple;
  Color get purpleContainer => LightThemeColor().purpleContainer;
  Color get goldGlowSoft => LightThemeColor().goldGlowSoft;
  Color get heroDelta => LightThemeColor().heroDelta;
  Color get heroDeltaContainer => LightThemeColor().heroDeltaContainer;
  Color get chartBar => LightThemeColor().chartBar;
  Color get toastErrorDot => LightThemeColor().toastErrorDot;
  Color get appBarActionColor => LightThemeColor().appBarActionColor;

  /// Request focus to given FocusNode
  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }

  /// Request focus to given FocusNode
  void unFocus(FocusNode focus) => focus.unfocus();

  bool get isArabic => locale == const Locale('ar');

  bool isPhone() => MediaQuery.sizeOf(this).width < tabletBreakpointGlobal;

  bool isTablet() =>
      MediaQuery.sizeOf(this).width < desktopBreakpointGlobal &&
      MediaQuery.sizeOf(this).width >= tabletBreakpointGlobal;

  bool isDesktop() => MediaQuery.sizeOf(this).width >= desktopBreakpointGlobal;

  Orientation get orientation => MediaQuery.orientationOf(this);

  double get keyboardPadding => MediaQuery.viewInsetsOf(this).bottom;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;

  TargetPlatform get platform => Theme.of(this).platform;

  bool get isAndroid => platform == TargetPlatform.android;

  bool get isIOS => platform == TargetPlatform.iOS;

  void openDrawer() => Scaffold.of(this).openDrawer();

  void openEndDrawer() => Scaffold.of(this).openEndDrawer();
  Map<dynamic, dynamic> get arg =>
      (ModalRoute.of(this)?.settings.arguments ?? {}) as Map<dynamic, dynamic>;
}
