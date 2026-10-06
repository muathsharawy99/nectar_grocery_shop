import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// "Fresh Vegetables — Get Up To 40% OFF" promo card.
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s10.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomImage(Assets.images.back.path, fit: BoxFit.cover),
          Row(
            children: [
              CustomImage(Assets.images.vege.path).expand(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.shop_banner_title.tr(),
                    style: context.display.copyWith(fontSize: FontSize.s18),
                  ),
                  Text(
                    LocaleKeys.shop_banner_subtitle.tr(),
                    style: context.semiBold.copyWith(
                      fontSize: FontSize.s15,
                      color: context.primaryColor,
                    ),
                  ),
                ],
              ).expand(flex: 3),
            ],
          ),
          CustomImage(Assets.images.deco.path, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
