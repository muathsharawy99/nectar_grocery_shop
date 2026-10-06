import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Grey rounded-bottom header with the product photo.
class ProductImageHeader extends StatelessWidget {
  const ProductImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: context.statusBarHeight + kToolbarHeight,
        bottom: AppSize.s20.h,
      ),
      decoration: BoxDecoration(
        color: context.surfaceVariant,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSize.s30.r),
        ),
      ),
      child: CustomImage(Assets.images.banana.path, height: AppSize.s200.h),
    );
  }
}
