// Widget Extensions

// ignore_for_file: strict_top_level_inference

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/theme/color/light_theme_color.dart';
import 'unified_extensions.dart';

Duration transitionDuration = const Duration(milliseconds: 300);

extension WidgetExtension on Widget {
  Widget get center => Align(alignment: Alignment.center, child: this);
  Widget buildLoadingWhen(bool value, Color color) => value
      ? this
      : Center(child: CustomProgress(size: AppSize.s40, color: color));
  Widget withPadding({
    double all = 0.0,
    double vertical = 0.0,
    double horizontal = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    double start = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: all + vertical + top,
        bottom: all + vertical + bottom,
        start: all + horizontal + start,
        end: all + horizontal + end,
      ),
      child: this,
    );
  }

  Widget get toEnd =>
      Align(alignment: AlignmentDirectional.centerEnd, child: this);
  Widget get toStart =>
      Align(alignment: AlignmentDirectional.centerStart, child: this);
  Widget get toBottom => Align(alignment: Alignment.bottomCenter, child: this);
  Widget get toBottomEnd =>
      Align(alignment: AlignmentDirectional.bottomEnd, child: this);
  Widget get toBottomStart =>
      Align(alignment: AlignmentDirectional.bottomStart, child: this);
  Widget get toTopEnd =>
      Align(alignment: AlignmentDirectional.topEnd, child: this);
  Widget get toTopStart =>
      Align(alignment: AlignmentDirectional.topStart, child: this);
  Widget get toTop => Align(alignment: Alignment.topCenter, child: this);

  /// set container to view
  Container setContainerToView({
    double? height,
    double? width,
    double? margin,
    double? padding,
    double? radius,
    Color? color,
    Color? borderColor,
    AlignmentGeometry? alignment,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: EdgeInsets.all(margin ?? 0),
      padding: EdgeInsets.all(padding ?? AppSize.s0.r),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? AppSize.s0.r),
          ),
          side: borderColor != null
              ? BorderSide(color: borderColor, width: AppSize.s1)
              : BorderSide.none,
        ),
      ),
      child: this,
    );
  }

  ClipRRect withGlassEffect({
    double? height,
    double? width,
    Color? color,
    bool hasBorder = true,
    double radius = AppSize.s16,
    double padding = AppSize.s0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          height: height ?? AppSize.s60.h,
          width: width,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(radius.r),
            border: hasBorder
                ? Border.all(
                    color: color ?? Colors.white.withValues(alpha: 0.6),
                    width: AppSize.s1.w,
                  )
                : null,
          ),
          child: this,
        ),
      ),
    );
  }

  Widget setTitleText(
    BuildContext context, {
    String? title,
    Widget? titleIcon,
    double? fontSize,
    TextStyle? titleStyle,
    double gap = AppSize.s8,
    double titlePadding = AppSize.s0,
  }) {
    return title != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style:
                        titleStyle ??
                        context.textTheme.bodyMedium!.copyWith(
                          fontSize: fontSize ?? FontSize.s16,
                        ),
                  ).withPadding(horizontal: titlePadding),
                  titleIcon ?? const SizedBox.shrink(),
                ],
              ),
              gap.verticalSpace,
              this,
            ],
          )
        : this;
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this : (defaultWidget ?? const SizedBox());
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    double bottomLeft = 0,
    double bottomRight = 0,
    double topLeft = 0,
    double topRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add corner radius
  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add tap to parent widget
  Widget onTap(
    Function? function, {
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) {
    return InkWell(
      onTap: function as void Function()?,
      splashColor: splashColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      borderRadius: borderRadius,

      child: this,
    );
  }

  /// Wrap with ShaderMask widget
  Widget withShaderMask(
    List<Color> colors, {
    BlendMode blendMode = BlendMode.srcATop,
  }) {
    return withShaderMaskGradient(
      LinearGradient(colors: colors),
      blendMode: blendMode,
    );
  }

  /// Wrap with ShaderMask widget Gradient
  Widget withShaderMaskGradient(
    Gradient gradient, {
    BlendMode blendMode = BlendMode.srcIn,
  }) {
    return ShaderMask(
      shaderCallback: (rect) => gradient.createShader(
        Rect.fromCircle(center: rect.center, radius: rect.width / 2),
      ),
      blendMode: blendMode,
      child: this,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this;

  Widget buildWhen({bool value = false}) => value ? this : const SizedBox();

  Widget withTooltip({required String msg}) =>
      Tooltip(message: msg, child: this);

  /// Make your any widget refreshable with RefreshIndicator on top
  // Widget get makeRefreshable => Stack(children: [ListView(), this]);

  RefreshIndicator makeRefreshable(
    Future<void> Function() onRefresh, {
    EdgeInsetsGeometry? padding,
  }) {
    return RefreshIndicator.adaptive(
      backgroundColor: LightThemeColor().surface,
      color: LightThemeColor().primary,
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding:
            padding ??
            const EdgeInsets.only(
              bottom: AppSize.bottomNavBarPadding,
              top: AppSize.screenPadding,
            ),
        children: [this],
      ),
    );
  }
}

extension ExtensionWidget on Widget {
  // Widget get center => Align(alignment: Alignment.center, child: this);

  // Widget paddingAll({
  //   double all = 0.0,
  //   double vertical = 0.0,
  //   double horizontal = 0.0,
  //   double top = 0.0,
  //   double bottom = 0.0,
  //   double start = 0.0,
  //   double end = 0.0,
  // }) {
  //   return Padding(
  //     padding: EdgeInsetsDirectional.only(
  //       top: all + vertical + top,
  //       bottom: all + vertical + bottom,
  //       start: all + horizontal + start,
  //       end: all + horizontal + end,
  //     ),
  //     child: this,
  //   );
  // }

  // Widget get toEnd =>
  //     Align(alignment: AlignmentDirectional.centerEnd, child: this);

  // Widget get toStart =>
  //     Align(alignment: AlignmentDirectional.centerStart, child: this);

  // Widget get toBottom => Align(alignment: Alignment.bottomCenter, child: this);

  // Widget get toBottomEnd =>
  //     Align(alignment: AlignmentDirectional.bottomEnd, child: this);

  // Widget get toBottomStart =>
  //     Align(alignment: AlignmentDirectional.bottomStart, child: this);

  // Widget get toTopEnd =>
  //     Align(alignment: AlignmentDirectional.topEnd, child: this);

  // Widget get toTopStart =>
  //     Align(alignment: AlignmentDirectional.topStart, child: this);

  // Widget get toTop => Align(alignment: Alignment.topCenter, child: this);
}

/// Extension on the [Widget] class to provide additional layout-related functionality.
extension LayoutExtensions on Widget {
  /// With custom width
  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  /// With custom height and width
  SizedBox withSize(double width, double height) =>
      SizedBox(width: width, height: height, child: this);

  ///scrollable
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    ScrollController? controller,
  }) {
    return SingleChildScrollView(
      controller: controller,
      padding:
          padding ??
          const EdgeInsets.only(
            bottom: AppSize.bottomNavBarPadding,
            top: AppSize.screenPadding,
          ),
      scrollDirection: scrollDirection,
      physics: physics ?? const BouncingScrollPhysics(),
      child: this,
    );
  }

  Widget scrollableList({
    Axis scrollDirection = Axis.vertical,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    ScrollController? controller,
  }) {
    return ListView(
      controller: controller,
      padding:
          padding ??
          const EdgeInsets.only(
            bottom: AppSize.bottomNavBarPadding,
            top: AppSize.screenPadding,
          ),
      scrollDirection: scrollDirection,
      physics: physics ?? const BouncingScrollPhysics(),
      children: [this],
    );
  }

  /// add Expanded to parent widget
  Widget expand({flex = 1}) => Expanded(flex: flex, child: this);

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit, bool buildWhen = true}) {
    return buildWhen
        ? Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this)
        : this;
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  Directionality withDirectionality(TextDirection textDirection) {
    return Directionality(textDirection: textDirection, child: this);
  }
}

extension TransformExtension on Widget {
  /// add rotation to parent widget
  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      origin: origin,
      angle: angle.toRadians,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add scaling to parent widget
  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add translate to parent widget
  Widget translate({
    required Offset offset,
    bool transformHitTests = true,
    Key? key,
  }) {
    return Transform.translate(
      offset: offset,
      transformHitTests: transformHitTests,
      key: key,
      child: this,
    );
  }
}

extension AnimationExtension on Widget {
  Widget setHero({String? heroKey}) {
    if (heroKey == null) return this;
    return Hero(tag: heroKey, child: this);
  }

  /// add opacity to parent widget
  Widget opacity({
    required double opacity,
    int durationInSecond = 1,
    Duration? duration,
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration ?? const Duration(milliseconds: 500),
      child: this,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget animationSwitch() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: this,
    );
  }

  Widget setAnimatedContainer({
    Duration? duration,
    double? width,
    double? height,
  }) {
    return AnimatedContainer(
      width: width,
      height: height,
      curve: Curves.fastOutSlowIn,
      duration: duration ?? const Duration(seconds: 5),
      child: this,
    );
  }
}

extension ContainerStyleExtensions on Widget {
  Widget asSettingCard({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
  }) {
    return Builder(
      builder: (context) => Container(
        padding: padding ?? EdgeInsets.all(AppSize.cardPadding.r),
        margin: margin ?? EdgeInsets.only(bottom: AppSize.s12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppSize.borderRadius.r,
          ),
          color: backgroundColor ?? context.cardSurface,
          border: Border.all(color: borderColor ?? context.borderColor),
          boxShadow: boxShadow,
        ),
        child: this,
      ),
    );
  }

  Widget asCardWithShadow({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    double? borderRadius,
    double? elevation,
  }) {
    return Builder(
      builder: (context) => Container(
        padding: padding ?? EdgeInsets.all(AppSize.s16.r),
        margin: margin ?? EdgeInsets.only(bottom: AppSize.s12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppSize.borderRadius.r,
          ),
          color: backgroundColor ?? context.cardSurface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: elevation ?? 8.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: this,
      ),
    );
  }

  /// Creates a gradient card
  Widget asGradientCard({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Gradient? gradient,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      padding: padding ?? EdgeInsets.all(AppSize.s16.r),
      margin: margin ?? EdgeInsets.only(bottom: AppSize.s12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSize.borderRadius.r,
        ),
        gradient: gradient ?? GradientStyles.linearGradient,
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
      ),
      child: this,
    );
  }

  /// Creates a bordered card
  Widget asBorderedCard({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
  }) {
    return Builder(
      builder: (context) => Container(
        padding: padding ?? EdgeInsets.all(AppSize.s12.r),
        margin: margin ?? EdgeInsets.only(bottom: AppSize.s16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppSize.borderRadius.r,
          ),
          color: backgroundColor ?? context.cardSurface,
          border: Border.all(
            color: borderColor ?? context.borderColor,
            width: borderWidth ?? 1.0,
          ),
        ),
        child: this,
      ),
    );
  }
}

extension ExtensionInt on int {
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get days => Duration(days: this);
  Duration get hours => Duration(hours: this);
  Duration get minutes => Duration(minutes: this);
  Duration get years => Duration(days: 365 * this);
}

extension ExtensionGlobalKeys on GlobalKey<FormState> {
  bool get isValid => currentState?.validate() ?? false;
}

extension ExtensionDateTime on DateTime {
  bool sameDay(DateTime? other) =>
      year == other?.year && month == other?.month && day == other?.day;
}
