import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// App-wide loader, adaptive to the platform: the Cupertino activity
/// indicator on iOS / macOS, a thin circular indicator elsewhere. Use it for
/// every loader instead of the raw Flutter widgets.
class CustomProgress extends StatelessWidget {
  final double size;
  final Color? color;

  const CustomProgress({super.key, required this.size, this.color});

  @override
  Widget build(BuildContext context) {
    final indicatorColor = color ?? context.primaryColor;
    final platform = Theme.of(context).platform;
    final isCupertino =
        platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
    return SizedBox.square(
      dimension: size,
      child: isCupertino
          ? CupertinoActivityIndicator(radius: size / 2, color: indicatorColor)
          : CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            ),
    );
  }
}

class LoadingApp extends StatelessWidget {
  const LoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CustomProgress(size: AppSize.s26.w));
  }
}
