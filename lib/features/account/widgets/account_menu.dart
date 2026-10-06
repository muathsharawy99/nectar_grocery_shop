import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import 'account_menu_tile.dart';

/// The account menu (rows are UI only for now).
class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String)>[
      (Icons.shopping_bag_outlined, LocaleKeys.account_orders.tr()),
      (Icons.credit_card_sharp, LocaleKeys.account_my_details.tr()),
      (Icons.location_on_outlined, LocaleKeys.account_delivery_address.tr()),
      (Icons.credit_card_sharp, LocaleKeys.account_payment_methods.tr()),
      (Icons.airplane_ticket_rounded, LocaleKeys.account_promo_code.tr()),
      (Icons.notifications, LocaleKeys.account_notifications.tr()),
      (Icons.help, LocaleKeys.account_help.tr()),
      (Icons.info_outline, LocaleKeys.account_about.tr()),
    ];
    return Column(
      children: [
        const Divider(),
        for (final (icon, title) in items) ...[
          AccountMenuTile(icon: icon, title: title),
          const Divider(),
        ],
      ],
    );
  }
}
