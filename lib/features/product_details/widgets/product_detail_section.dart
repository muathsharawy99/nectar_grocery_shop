import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// "Product Detail" header that expands to show the description.
class ProductDetailSection extends StatelessWidget {
  const ProductDetailSection({
    super.key,
    required this.description,
    required this.isExpanded,
    required this.onToggle,
  });

  final String description;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              LocaleKeys.product_detail.tr(),
              style: context.semiBold.copyWith(fontSize: FontSize.s16),
            ).expand(),
            IconButton(
              onPressed: onToggle,
              icon: Icon(
                isExpanded ? Icons.keyboard_arrow_down : Icons.chevron_right,
              ),
            ),
          ],
        ),
        if (isExpanded) ...[
          SizedBox(height: AppSize.s10.h),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.regular.copyWith(
              fontSize: FontSize.s13,
              color: context.mediumTextColor,
            ),
          ),
        ],
      ],
    );
  }
}
