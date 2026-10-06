import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../widgets/favorite_tile.dart';

/// Favorite tab (UI only until favorites have an API).
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const _sampleCount = 5;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: AppSize.s10.h),
      children: [
        Text(
          LocaleKeys.favorite_title.tr(),
          textAlign: TextAlign.center,
          style: context.bold.copyWith(fontSize: FontSize.s20),
        ),
        SizedBox(height: AppSize.s15.h),
        const Divider(),
        for (var i = 0; i < _sampleCount; i++) ...[
          const FavoriteTile(),
          if (i < _sampleCount - 1)
            Divider(indent: AppSize.s10.w, endIndent: AppSize.s10.w),
        ],
        const Divider(),
        SizedBox(height: AppSize.s100.h),
        ButtonWidget(
          title: LocaleKeys.favorite_add_all_to_cart.tr(),
          onTap: () {},
        ).withPadding(horizontal: AppSize.s30.w),
      ],
    );
  }
}
