import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Colored carrot logo, page title and subtitle (login / sign up).
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s80.h),
        CustomImage(
          Assets.images.carrotColored.path,
          width: AppSize.s70.w,
          height: AppSize.s70.w,
        ).center,
        SizedBox(height: AppSize.s30.h),
        Text(title, style: context.medium.copyWith(fontSize: FontSize.s20)),
        SizedBox(height: AppSize.s10.h),
        Text(
          subtitle,
          style: context.regular.copyWith(
            fontSize: FontSize.s14,
            color: context.mediumTextColor,
          ),
        ),
        SizedBox(height: AppSize.s25.h),
      ],
    );
  }
}
