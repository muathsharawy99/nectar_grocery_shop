import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

class CustomRadiusIcon extends StatelessWidget {
  final Color? backgroundColor;
  final double? size;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final void Function()? onTap;
  final Clip? clipBehavior;
  const CustomRadiusIcon({
    super.key,
    this.backgroundColor,
    this.size,
    this.child,
    this.margin,
    this.onTap,
    this.borderRadius,
    this.borderColor,
    this.clipBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: size ?? AppSize.s32.w,
        width: size ?? AppSize.s32.w,
        clipBehavior: clipBehavior ?? Clip.none,
        decoration: BoxDecoration(
          color: backgroundColor ?? context.primaryContainer,
          borderRadius: borderRadius,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          shape: borderRadius != null ? BoxShape.rectangle : BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
