import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

import '../../../gen/locale_keys.g.dart';

/// Currency symbol (`LocaleKeys.currency` = `$`) + amount, in the amount
/// style. The symbol comes first, like the design (`$4.99`).
class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.amount, this.amountStyle});

  final String amount;
  final TextStyle? amountStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${LocaleKeys.currency.tr()}$amount',
      style: amountStyle,
      textDirection: TextDirection.ltr,
    );
  }
}
