import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// Asset image (`Assets.images.x.path`) with optional size, fit, tint and
/// rounded corners; a broken-image icon when the asset can't load.
class CustomImage extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const CustomImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          color: context.surfaceVariant,
          child: Icon(
            Icons.broken_image_outlined,
            color: context.hintColor,
            size: AppSize.s24.w,
          ),
        ),
      ),
    );
  }
}
