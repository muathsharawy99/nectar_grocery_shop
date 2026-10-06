import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// One cart line: image, name, unit, quantity picker and price.
class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final ProductModel product;
  final int quantity;
  final VoidCallback onIncrement, onDecrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            Assets.images.ginger.path,
            width: AppSize.s70.w,
            height: AppSize.s65.w,
          ),
          SizedBox(width: AppSize.s15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.bold.copyWith(fontSize: FontSize.s16),
                  ).expand(),
                  // UI only: the store API has no remove-from-cart yet.
                  Icon(Icons.close, color: context.mutedTextColor),
                ],
              ),
              Text(
                LocaleKeys.cart_unit_price.tr(),
                style: context.regular.copyWith(
                  fontSize: FontSize.s14,
                  color: context.mediumTextColor,
                ),
              ),
              Row(
                children: [
                  QuantityCounter(
                    quantity: quantity,
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                  ),
                  const Spacer(),
                  PriceWidget(
                    amount: product.priceText,
                    amountStyle: context.semiBold.copyWith(
                      fontSize: FontSize.s18,
                    ),
                  ),
                ],
              ),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
