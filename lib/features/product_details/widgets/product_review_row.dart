import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import 'rating_stars.dart';

/// "Review" with the stars and an arrow.
class ProductReviewRow extends StatelessWidget {
  const ProductReviewRow({
    super.key,
    required this.rating,
    required this.onRate,
  });

  final double rating;
  final ValueChanged<double> onRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LocaleKeys.product_review.tr(),
          style: context.semiBold.copyWith(fontSize: FontSize.s16),
        ).expand(),
        RatingStars(rating: rating, onRate: onRate),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
      ],
    );
  }
}
