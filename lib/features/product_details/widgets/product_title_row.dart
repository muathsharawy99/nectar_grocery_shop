import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// Product name with the favorite toggle, and the available quantity.
class ProductTitleRow extends StatelessWidget {
  const ProductTitleRow({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavorite,
  });

  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              product.name,
              style: context.bold.copyWith(fontSize: FontSize.s20),
            ).expand(),
            IconButton(
              onPressed: onFavorite,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? context.errorTextColor
                    : context.mediumTextColor,
              ),
            ),
          ],
        ),
        Text(
          LocaleKeys.product_available.tr(args: ['${product.quantity}']),
          style: context.regular.copyWith(
            fontSize: FontSize.s14,
            color: context.mediumTextColor,
          ),
        ),
      ],
    );
  }
}
