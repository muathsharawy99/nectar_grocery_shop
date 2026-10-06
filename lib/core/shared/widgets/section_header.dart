import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/locale_keys.g.dart';
import '../../extensions/unified_extensions.dart';

/// Section title with a "See all" button (shop tab sections).
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.onSeeAll});

  final String title;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: context.semiBold.copyWith(fontSize: FontSize.s22),
        ).expand(),
        TextButton(
          onPressed: onSeeAll ?? () {},
          child: Text(
            LocaleKeys.shop_see_all.tr(),
            style: context.semiBold.copyWith(
              fontSize: FontSize.s16,
              color: context.primaryColor,
            ),
          ),
        ),
      ],
    ).withPadding(horizontal: AppSize.screenPadding.w);
  }
}
