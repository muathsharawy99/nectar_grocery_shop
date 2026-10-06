import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

/// Five tappable stars (half stars shown for .5 ratings).
class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating, required this.onRate});

  final double rating;
  final ValueChanged<double> onRate;

  IconData _icon(int index) {
    if (rating >= index + 1) return Icons.star;
    if (rating >= index + .5) return Icons.star_half;
    return Icons.star_border;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            _icon(i),
            color: context.ratingColor,
            size: AppSize.s24.w,
          ).onTap(() => onRate(i + 1.0)),
      ],
    );
  }
}
