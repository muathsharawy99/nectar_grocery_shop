import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../../widgets/auth_scaffold.dart';

/// Pick the delivery zone (UI only), then back to login.
class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      withBack: true,
      reverse: true,
      child: Column(
        children: [
          SizedBox(height: AppSize.s80.h),
          CustomImage(Assets.images.location.path),
          SizedBox(height: AppSize.s20.h),
          Text(
            LocaleKeys.auth_select_location_title.tr(),
            style: context.medium.copyWith(fontSize: FontSize.s20),
          ),
          SizedBox(height: AppSize.s20.h),
          Text(
            LocaleKeys.auth_select_location_subtitle.tr(),
            textAlign: TextAlign.center,
            style: context.regular.copyWith(
              fontSize: FontSize.s14,
              color: context.mediumTextColor,
            ),
          ),
          SizedBox(height: AppSize.s80.h),
          AppField(
            title: LocaleKeys.auth_your_zone.tr(),
            keyboardType: TextInputType.streetAddress,
          ),
          SizedBox(height: AppSize.s80.h),
          ButtonWidget(
            title: LocaleKeys.auth_submit.tr(),
            onTap: () => pushAndRemoveUntil(NamedRoutes.login),
          ),
        ],
      ),
    );
  }
}
