import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// "Or connect with social media" + Google and Facebook buttons (UI only).
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.auth_social_title.tr(),
          style: context.medium.copyWith(
            fontSize: FontSize.s14,
            color: context.mediumTextColor,
          ),
        ),
        SizedBox(height: AppSize.s20.h),
        ButtonWidget(
          title: LocaleKeys.auth_continue_with_google.tr(),
          image: Assets.images.google.path,
          imageColor: context.onPrimary,
          buttonColor: context.googleColor,
          withShadow: false,
          onTap: () {},
        ),
        SizedBox(height: AppSize.s20.h),
        ButtonWidget(
          title: LocaleKeys.auth_continue_with_facebook.tr(),
          image: Assets.images.facebook.path,
          imageColor: context.onPrimary,
          buttonColor: context.facebookColor,
          withShadow: false,
          onTap: () {},
        ),
      ],
    );
  }
}
