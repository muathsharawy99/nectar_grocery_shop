import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// Carrot logo, welcome title, subtitle and the "Get Started" button.
class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImage(Assets.images.carrot.path, width: AppSize.s50.w),
        SizedBox(height: AppSize.s10.h),
        Text(
          LocaleKeys.onboarding_title.tr(),
          textAlign: TextAlign.center,
          style: context.bold.copyWith(
            fontSize: FontSize.s35,
            color: context.onPrimary,
            height: 1.2,
          ),
        ),
        SizedBox(height: AppSize.s10.h),
        Text(
          LocaleKeys.onboarding_subtitle.tr(),
          textAlign: TextAlign.center,
          style: context.light.copyWith(
            fontSize: FontSize.s13,
            color: context.onPrimary,
          ),
        ),
        SizedBox(height: AppSize.s20.h),
        ButtonWidget(
          title: LocaleKeys.onboarding_get_started.tr(),
          width: AppSize.s300.w,
          onTap: onStart,
        ),
      ],
    );
  }
}
