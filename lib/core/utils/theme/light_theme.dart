import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
import '../../resources/fonts_manager.dart';
import 'color/light_theme_color.dart';
import 'theme_constants.dart';

class LightTheme {
  static TextStyle textRegular = TextStylesManager.regularText;
  static TextStyle textMedium = TextStylesManager.mediumText;
  static TextStyle textSemiBold = TextStylesManager.semiBoldText;
  static TextStyle textBold = TextStylesManager.boldText;

  /// [fontFamily]: Poppins for English, IBM Plex Sans Arabic for Arabic
  /// (Poppins has no Arabic glyphs).
  static ThemeData getTheme({String fontFamily = FontFamily.poppins}) {
    final colors = LightThemeColor();
    final textRegular = LightTheme.textRegular.copyWith(fontFamily: fontFamily);
    final textMedium = LightTheme.textMedium.copyWith(fontFamily: fontFamily);
    final textSemiBold = LightTheme.textSemiBold.copyWith(
      fontFamily: fontFamily,
    );
    final textBold = LightTheme.textBold.copyWith(fontFamily: fontFamily);
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusButton.r),
    );

    // Nectar fields are underlined (no box), like the original design.
    UnderlineInputBorder fieldBorder(Color color) =>
        UnderlineInputBorder(borderSide: BorderSide(color: color));

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: fontFamily,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.scaffoldColor,
      canvasColor: colors.scaffoldColor,
      cardColor: colors.cardSurface,
      dividerColor: colors.dividerColor,
      hintColor: colors.hintColor,

      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.primaryContainer,
        onPrimaryContainer: colors.primary,
        secondary: colors.secondary,
        onSecondary: colors.onPrimary,
        secondaryContainer: colors.secondaryContainer,
        onSecondaryContainer: colors.secondaryText,
        tertiary: colors.infoColor,
        onTertiary: colors.onPrimary,
        error: colors.errorText,
        onError: colors.onPrimary,
        errorContainer: colors.errorContainer,
        onErrorContainer: colors.errorText,
        surface: colors.surface,
        onSurface: colors.defaultTextColor,
        onSurfaceVariant: colors.mediumText,
        surfaceContainerLowest: colors.surface,
        surfaceContainerLow: colors.textFieldColor,
        surfaceContainer: colors.scaffoldColor,
        surfaceContainerHigh: colors.surfaceVariant,
        surfaceContainerHighest: colors.surfaceVariant,
        outline: colors.borderColor,
        outlineVariant: colors.borderLight,
        shadow: colors.primaryPressed,
        scrim: colors.barrierColor,
        inverseSurface: colors.toastColor,
        onInverseSurface: colors.onPrimary,
        inversePrimary: colors.cream,
        surfaceTint: Colors.transparent,
      ),

      textTheme: TextTheme(
        displayLarge: textBold.copyWith(
          fontSize: FontSize.s31,
          letterSpacing: -0.5,
          color: colors.defaultTextColor,
        ),
        displayMedium: textBold.copyWith(
          fontSize: FontSize.s29,
          letterSpacing: -0.3,
          color: colors.defaultTextColor,
        ),
        displaySmall: textBold.copyWith(
          fontSize: FontSize.s25,
          color: colors.defaultTextColor,
        ),
        headlineSmall: textBold.copyWith(
          fontSize: FontSize.s17,
          color: colors.defaultTextColor,
        ),
        bodyLarge: textBold.copyWith(
          fontSize: FontSize.s17,
          color: colors.defaultTextColor,
        ),
        bodyMedium: textMedium.copyWith(
          fontSize: FontSize.s13,
          color: colors.defaultTextColor,
        ),
        bodySmall: textRegular.copyWith(
          fontSize: FontSize.s11_5,
          color: colors.mediumText,
        ),
        titleLarge: textBold.copyWith(
          fontSize: FontSize.s15,
          color: colors.defaultTextColor,
        ),
        titleMedium: textSemiBold.copyWith(
          fontSize: FontSize.s14,
          color: colors.defaultTextColor,
        ),
        titleSmall: textRegular.copyWith(
          fontSize: FontSize.s13,
          color: colors.defaultTextColor,
        ),
        labelLarge: textSemiBold.copyWith(
          fontSize: FontSize.s14_5,
          color: colors.defaultTextColor,
        ),
        labelMedium: textSemiBold.copyWith(
          fontSize: FontSize.s12_5,
          color: colors.labelText,
        ),
        labelSmall: textRegular.copyWith(
          fontSize: FontSize.s10_5,
          color: colors.hintColor,
        ),
      ),

      iconTheme: IconThemeData(
        color: colors.defaultTextColor,
        size: AppSize.s18.w,
      ),

      // Nectar pages use white app bars (dark status bar icons); the green
      // `CustomAppBar` sets its own light overlay.
      appBarTheme: AppBarThemeData(
        backgroundColor: colors.scaffoldColor,
        foregroundColor: colors.defaultTextColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: textBold.copyWith(
          fontSize: FontSize.s20,
          color: colors.defaultTextColor,
        ),
        iconTheme: IconThemeData(
          color: colors.defaultTextColor,
          size: AppSize.s20.w,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),

      dividerTheme: DividerThemeData(
        color: colors.dividerColor,
        thickness: AppSize.s1,
        space: AppSize.s1,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.controlBorder,
          disabledForegroundColor: colors.onPrimary,
          elevation: 0,
          minimumSize: Size.fromHeight(AppSize.buttonHeight.h),
          shape: buttonShape,
          textStyle: textSemiBold.copyWith(fontSize: FontSize.s14_5),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.regularText,
          backgroundColor: colors.surface,
          minimumSize: Size.fromHeight(AppSize.buttonHeightSmall.h),
          side: BorderSide(color: colors.borderColor),
          shape: buttonShape,
          textStyle: textSemiBold.copyWith(fontSize: FontSize.s13_5),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          minimumSize: Size.zero,
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.s4.w,
            vertical: AppSize.s4.h,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: textSemiBold.copyWith(fontSize: FontSize.s12),
        ),
      ),

      inputDecorationTheme: InputDecorationThemeData(
        filled: false,
        fillColor: colors.textFieldColor,
        isDense: true,
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: AppSize.s0,
          vertical: AppSize.s12_5.h,
        ),
        hintStyle: textRegular.copyWith(
          fontSize: FontSize.s14,
          color: colors.hintColor,
        ),
        errorStyle: textRegular.copyWith(
          fontSize: FontSize.s11_5,
          color: colors.errorText,
        ),
        errorMaxLines: 2,
        prefixIconColor: colors.hintColor,
        suffixIconColor: colors.hintColor,
        // Same height for every field, with or without icons: without these
        // an icon keeps its 48px box and makes that field taller.
        constraints: BoxConstraints(minHeight: AppSize.textFieldHeight.h),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        border: fieldBorder(colors.borderColor),
        enabledBorder: fieldBorder(colors.borderColor),
        focusedBorder: fieldBorder(colors.primary),
        errorBorder: fieldBorder(colors.errorBorderStrong),
        focusedErrorBorder: fieldBorder(colors.errorText),
        disabledBorder: fieldBorder(colors.borderLight),
      ),

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.primary,
        selectionColor: colors.primary.withValues(alpha: .2),
        selectionHandleColor: colors.primary,
      ),

      cardTheme: CardThemeData(
        color: colors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRadius.r),
          side: BorderSide(color: colors.borderColor),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        barrierColor: colors.barrierColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s24.r),
        ),
        titleTextStyle: textBold.copyWith(
          fontSize: FontSize.s15,
          color: colors.defaultTextColor,
        ),
        contentTextStyle: textRegular.copyWith(
          fontSize: FontSize.s12_5,
          color: colors.regularText,
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
        modalBackgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        modalElevation: 0,
        modalBarrierColor: colors.barrierColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSize.radiusSheet.r),
          ),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.surface,
        selectedColor: colors.primary,
        showCheckmark: false,
        side: BorderSide(color: colors.borderColor),
        shape: const StadiumBorder(),
        labelStyle: textSemiBold.copyWith(
          fontSize: FontSize.s12,
          color: colors.regularText,
        ),
        secondaryLabelStyle: textSemiBold.copyWith(
          fontSize: FontSize.s12,
          color: colors.onPrimary,
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s4.r),
        ),
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.primary
              : colors.surface,
        ),
        checkColor: WidgetStateProperty.all(colors.onPrimary),
        side: WidgetStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: AppSize.s1_5,
            color: states.contains(WidgetState.selected)
                ? colors.primary
                : colors.controlBorder,
          ),
        ),
      ),

      radioTheme: RadioThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.primary
              : colors.controlBorder,
        ),
      ),

      switchTheme: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        thumbColor: WidgetStateProperty.all(colors.surface),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.switchOnColor
              : colors.switchOffColor,
        ),
      ),

      tabBarTheme: TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: colors.onPrimary,
        unselectedLabelColor: colors.mediumText,
        labelStyle: textSemiBold.copyWith(fontSize: FontSize.s12_5),
        unselectedLabelStyle: textSemiBold.copyWith(fontSize: FontSize.s12_5),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        indicator: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(AppSize.s10.r),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surface,
        elevation: 0,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.navBarInactiveColor,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(size: AppSize.s21.w),
        unselectedIconTheme: IconThemeData(size: AppSize.s21.w),
        selectedLabelStyle: textBold.copyWith(fontSize: FontSize.s10),
        unselectedLabelStyle: textMedium.copyWith(fontSize: FontSize.s10),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.surfaceVariant,
      ),
    );
  }
}
