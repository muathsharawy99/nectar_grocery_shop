import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../extensions/unified_extensions.dart';

/// App-wide loader, adaptive to the platform: the Cupertino activity
/// indicator on iOS / macOS, a thin circular indicator elsewhere. A [value]
/// (determinate progress) is shown as a partially revealed indicator on
/// iOS. Use it for every loader instead of the raw Flutter widgets.
class CustomProgress extends StatelessWidget {
  final double size;
  final double? strokeWidth;
  final Color? color;
  final double? value;
  final Color? backgroundColor;
  const CustomProgress({
    super.key,
    required this.size,
    this.strokeWidth,
    this.color,
    this.backgroundColor,
    this.value,
  });
  static bool isCupertino(BuildContext context) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
  }

  @override
  Widget build(BuildContext context) {
    final indicatorColor = color ?? context.primaryColor;
    if (isCupertino(context)) {
      return SizedBox(
        height: size,
        width: size,
        child: Center(
          child: value != null
              ? CupertinoActivityIndicator.partiallyRevealed(
                  radius: size / 2,
                  color: indicatorColor,
                  progress: value!.clamp(0.0, 1.0).toDouble(),
                )
              : CupertinoActivityIndicator(
                  radius: size / 2,
                  color: indicatorColor,
                ),
        ),
      );
    }
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth ?? 2,
        backgroundColor: backgroundColor,
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

class PaginationLoading extends StatelessWidget {
  final bool isLoading;
  const PaginationLoading({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        width: context.w,
        padding: EdgeInsets.symmetric(vertical: AppSize.s4.h),
        color: context.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProgress(
              size: AppSize.s12.w,
              color: context.onPrimary,
            ).withPadding(end: AppSize.s8.w),
            Text(
              LocaleKeys.static_loading.tr(),
              style: context.medium.copyWith(
                fontSize: FontSize.s12,
                color: context.onPrimary,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

Future<dynamic> loadingDialog() {
  return showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    context: navigator.currentContext!,
    builder: (x) => const LoadingApp(),
  );
}

void hideLoadingDialog() {
  Navigator.pop(navigator.currentContext!);
}
