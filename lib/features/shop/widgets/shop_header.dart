import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// Carrot logo and the delivery location.
class ShopHeader extends StatelessWidget {
  const ShopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(
          Assets.images.carrotColored.path,
          width: AppSize.s50.w,
          height: AppSize.s50.w,
        ),
        SizedBox(height: AppSize.s15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: context.regularTextColor),
            Text(
              LocaleKeys.shop_location.tr(),
              style: context.semiBold.copyWith(
                fontSize: FontSize.s16,
                color: context.regularTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
