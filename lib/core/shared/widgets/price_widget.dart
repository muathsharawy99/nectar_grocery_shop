import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/locale_keys.g.dart';
import 'loading.dart';

/// Currency symbol (`LocaleKeys.currency` = `$`) + amount, in the amount
/// style. The symbol comes first, like the design (`$4.99`).
class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    this.amount,
    this.amountStyle,
    this.currencyColor,
    this.isLoading = false,
    this.loadingWidget,
  });

  final String? amount;
  final TextStyle? amountStyle;
  final Color? currencyColor;
  final bool isLoading;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ??
          CustomProgress(size: 20.w, color: amountStyle?.color);
    }
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: LocaleKeys.currency.tr(),
            style: currencyColor == null
                ? null
                : TextStyle(color: currencyColor),
          ),
          TextSpan(text: amount ?? ''),
        ],
      ),
      style: amountStyle,
      textDirection: TextDirection.ltr,
    );
  }
}
