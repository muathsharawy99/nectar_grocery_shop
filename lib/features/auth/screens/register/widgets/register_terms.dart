import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// "By continuing you agree to our Terms of Service and Privacy Policy."
class RegisterTerms extends StatelessWidget {
  const RegisterTerms({super.key});

  @override
  Widget build(BuildContext context) {
    final link = context.medium.copyWith(
      fontSize: FontSize.s12,
      color: context.primaryColor,
    );
    return Padding(
      padding: EdgeInsets.only(top: AppSize.s10.h),
      child: Text.rich(
        TextSpan(
          style: context.regular.copyWith(
            fontSize: FontSize.s12,
            color: context.mediumTextColor,
          ),
          children: [
            TextSpan(text: LocaleKeys.auth_terms_prefix.tr()),
            TextSpan(text: LocaleKeys.auth_terms_of_service.tr(), style: link),
            TextSpan(text: LocaleKeys.auth_terms_and.tr()),
            TextSpan(text: LocaleKeys.auth_privacy_policy.tr(), style: link),
          ],
        ),
      ),
    );
  }
}
