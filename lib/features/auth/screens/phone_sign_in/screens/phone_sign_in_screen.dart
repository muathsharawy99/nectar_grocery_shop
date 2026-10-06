import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../widgets/phone_sign_in_header.dart';
import '../widgets/social_buttons.dart';

/// Sign in with the mobile number (UI only): tapping the number field opens
/// the mobile number page.
class PhoneSignInScreen extends StatelessWidget {
  const PhoneSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PhoneSignInHeader(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.auth_phone_sign_in_title.tr(),
                  style: context.semiBold.copyWith(fontSize: FontSize.s20),
                ),
                SizedBox(height: AppSize.s15.h),
                AppField(
                  hintText: LocaleKeys.auth_mobile_number.tr(),
                  keyboardType: TextInputType.phone,
                  onTap: () => push(NamedRoutes.mobileNumber),
                  suffixIcon: const SizedBox.shrink(),
                ),
                SizedBox(height: AppSize.s25.h),
                const SocialButtons(),
              ],
            ).withPadding(all: AppSize.s15.w),
          ],
        ),
      ),
    );
  }
}
