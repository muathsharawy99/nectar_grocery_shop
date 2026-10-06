import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// Bottom-navigation tabs, in the design's order.
enum LayoutTab {
  shop,
  explore,
  cart,
  favorite,
  account;

  String get label => switch (this) {
    LayoutTab.shop => LocaleKeys.layout_shop.tr(),
    LayoutTab.explore => LocaleKeys.layout_explore.tr(),
    LayoutTab.cart => LocaleKeys.layout_cart.tr(),
    LayoutTab.favorite => LocaleKeys.layout_favorite.tr(),
    LayoutTab.account => LocaleKeys.layout_account.tr(),
  };

  IconData get icon => switch (this) {
    LayoutTab.shop => Icons.store,
    LayoutTab.explore => Icons.explore,
    LayoutTab.cart => Icons.shopping_cart,
    LayoutTab.favorite => Icons.favorite_border,
    LayoutTab.account => Icons.person_outline_outlined,
  };
}
