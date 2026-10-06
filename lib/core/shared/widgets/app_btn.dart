import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// main: solid green with shadow (screen main action)
/// inActive: faded green (form not ready yet)
/// error: solid red (destructive action)
/// border: white with border (secondary / cancel)
/// light: white with green text (main action on dark backgrounds)
enum ButtonLook { main, inActive, error, border, light }

class ButtonWidget extends StatefulWidget {
  final String? title;
  final double? width, height;
  final double? fontSize;
  final double? radius;
  final double? padding;
  final String? image;
  final String? secondImage;
  final void Function()? onTap;
  final ButtonLook buttonLook;
  final bool isLoading;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? imageColor;
  final bool? isAlignStart;
  final TextStyle? textStyle;
  final Duration? animationDuration;
  final bool withShadow;

  const ButtonWidget({
    super.key,
    required this.title,
    this.width,
    this.fontSize,
    this.image,
    this.radius,
    this.padding,
    this.buttonColor,
    this.imageColor,
    this.textColor,
    this.borderColor,
    this.height,
    required this.onTap,
    this.buttonLook = ButtonLook.main,
    this.isLoading = false,
    this.isAlignStart = false,
    this.secondImage,
    this.textStyle,
    this.animationDuration,
    this.withShadow = true,
  });

  @override
  ButtonWidgetState createState() => ButtonWidgetState();
}

class ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 120),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _enabled => widget.onTap != null && !widget.isLoading;

  void _handleTapDown(TapDownDetails details) {
    if (!_enabled) return;
    setState(() => isPressed = true);
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => isPressed = false);
    _animationController.reverse();
  }

  void _handleTapCancel() {
    setState(() => isPressed = false);
    _animationController.reverse();
  }

  Color _buttonColor(BuildContext context) {
    if (widget.buttonColor != null) return widget.buttonColor!;
    return switch (widget.buttonLook) {
      ButtonLook.main =>
        isPressed ? context.primaryPressed : context.primaryColor,
      ButtonLook.inActive => context.primaryColor.withValues(alpha: .45),
      ButtonLook.error => context.errorTextColor,
      ButtonLook.border || ButtonLook.light => context.surfacesColor,
    };
  }

  Color _textColor(BuildContext context) {
    if (widget.textColor != null) return widget.textColor!;
    return switch (widget.buttonLook) {
      ButtonLook.border => context.labelTextColor,
      ButtonLook.light => context.primaryColor,
      _ => context.onPrimary,
    };
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = _buttonColor(context);
    final textColor = _textColor(context);
    final isBorder = widget.buttonLook == ButtonLook.border;
    final hasShadow =
        widget.withShadow && widget.buttonLook == ButtonLook.main && _enabled;
    final radius = BorderRadius.circular(
      widget.radius ?? AppSize.radiusButton.r,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _enabled ? widget.onTap : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width ?? double.infinity,
          height:
              widget.height ??
              (isBorder ? AppSize.buttonHeightSmall.h : AppSize.buttonHeight.h),
          padding: EdgeInsets.symmetric(
            horizontal: widget.padding ?? AppSize.s16.w,
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: radius,
            border: Border.all(
              color:
                  widget.borderColor ??
                  (isBorder ? context.borderColor : Colors.transparent),
            ),
            boxShadow: hasShadow ? ShadowStyles.button : null,
          ),
          child: Row(
            mainAxisAlignment: widget.isAlignStart == true
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              if (widget.isLoading)
                CustomProgress(size: AppSize.s18.w, color: textColor)
              else ...[
                if (widget.image != null) ...[
                  CustomImage(
                    widget.image,
                    width: AppSize.s18.w,
                    height: AppSize.s18.w,
                    color: widget.imageColor ?? textColor,
                  ),
                  AppSize.s8.w.horizontalSpace,
                ],
                if (widget.title != null)
                  Flexible(
                    child: Text(
                      widget.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          widget.textStyle ??
                          context.semiBold.copyWith(
                            fontSize:
                                widget.fontSize ??
                                (isBorder ? FontSize.s13_5 : FontSize.s14_5),
                            fontWeight: widget.buttonLook == ButtonLook.light
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: textColor,
                          ),
                    ),
                  ),
                if (widget.secondImage != null) ...[
                  AppSize.s8.w.horizontalSpace,
                  CustomImage(
                    widget.secondImage,
                    width: AppSize.s18.w,
                    height: AppSize.s18.w,
                    color: widget.imageColor ?? textColor,
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
