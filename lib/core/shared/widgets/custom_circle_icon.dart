import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// Round tinted box holding an icon (error / empty states).
class CustomRadiusIcon extends StatelessWidget {
  final Color? backgroundColor;
  final double? size;
  final Widget? child;

  const CustomRadiusIcon({
    super.key,
    this.backgroundColor,
    this.size,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? AppSize.s32.w,
      width: size ?? AppSize.s32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
