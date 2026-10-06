import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// main: solid green with shadow (screen main action)
/// border: white with border (secondary / refresh)
enum ButtonLook { main, border }

class ButtonWidget extends StatefulWidget {
  final String title;
  final double? width;
  final void Function()? onTap;
  final ButtonLook buttonLook;
  final bool isLoading;
  final Color? buttonColor;
  final Color? textColor;
  final bool withShadow;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.buttonLook = ButtonLook.main,
    this.isLoading = false,
    this.buttonColor,
    this.textColor,
    this.withShadow = true,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 120),
    vsync: this,
  );
  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 1.0,
    end: 0.97,
  ).animate(
    CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
  );
  bool isPressed = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _enabled => widget.onTap != null && !widget.isLoading;

  void _press(bool pressed) {
    if (pressed && !_enabled) return;
    setState(() => isPressed = pressed);
    pressed ? _animationController.forward() : _animationController.reverse();
  }

  Color _buttonColor(BuildContext context) {
    if (widget.buttonColor != null) return widget.buttonColor!;
    return switch (widget.buttonLook) {
      ButtonLook.main =>
        isPressed ? context.primaryPressed : context.primaryColor,
      ButtonLook.border => context.surfacesColor,
    };
  }

  Color _textColor(BuildContext context) {
    if (widget.textColor != null) return widget.textColor!;
    return switch (widget.buttonLook) {
      ButtonLook.main => context.onPrimary,
      ButtonLook.border => context.labelTextColor,
    };
  }

  @override
  Widget build(BuildContext context) {
    final textColor = _textColor(context);
    final isBorder = widget.buttonLook == ButtonLook.border;
    final hasShadow =
        widget.withShadow && widget.buttonLook == ButtonLook.main && _enabled;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _press(true),
      onTapUp: (_) => _press(false),
      onTapCancel: () => _press(false),
      onTap: _enabled ? widget.onTap : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width ?? double.infinity,
          height: isBorder
              ? AppSize.buttonHeightSmall.h
              : AppSize.buttonHeight.h,
          padding: EdgeInsets.symmetric(horizontal: AppSize.s16.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _buttonColor(context),
            borderRadius: BorderRadius.circular(AppSize.radiusButton.r),
            border: Border.all(
              color: isBorder ? context.borderColor : Colors.transparent,
            ),
            boxShadow: hasShadow ? ShadowStyles.button : null,
          ),
          child: widget.isLoading
              ? CustomProgress(size: AppSize.s18.w, color: textColor)
              : Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.semiBold.copyWith(
                    fontSize: isBorder ? FontSize.s13_5 : FontSize.s14_5,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
