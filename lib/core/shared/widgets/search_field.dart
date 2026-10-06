import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/locale_keys.g.dart';
import '../../extensions/unified_extensions.dart';

/// Grey rounded "Search Store" field (shop and explore tabs).
class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppField(
      hintText: LocaleKeys.shop_search_store.tr(),
      margin: EdgeInsets.zero,
      radius: AppSize.borderRadius,
      borderColor: context.searchFieldColor,
      fillColor: context.searchFieldColor,
      prefixIcon: Icon(
        Icons.search,
        color: context.defaultTextColor,
        size: AppSize.s22.w,
      ),
      contentPadding: EdgeInsetsDirectional.symmetric(
        horizontal: AppSize.s12.w,
        vertical: AppSize.s14.h,
      ),
      textInputAction: TextInputAction.search,
    );
  }
}
