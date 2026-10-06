import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// One favorite line: image, name, unit, price and an arrow.
class FavoriteTile extends StatelessWidget {
  const FavoriteTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomImage(Assets.images.ginger.path),
      title: Text(
        LocaleKeys.favorite_sample_name.tr(),
        style: context.bold.copyWith(fontSize: FontSize.s15),
      ),
      subtitle: Text(
        LocaleKeys.favorite_sample_unit.tr(),
        style: context.regular.copyWith(
          fontSize: FontSize.s14,
          color: context.mediumTextColor,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PriceWidget(
            amount: '2.99',
            amountStyle: context.semiBold.copyWith(fontSize: FontSize.s15),
          ),
          Icon(Icons.chevron_right, color: context.defaultTextColor),
        ],
      ),
    ).withPadding(horizontal: AppSize.screenPadding.w);
  }
}
