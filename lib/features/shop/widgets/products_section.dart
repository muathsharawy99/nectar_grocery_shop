import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

import 'section_state_view.dart';

/// Section title + horizontal list of product cards.
class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
    required this.title,
    required this.products,
    required this.status,
    required this.msg,
    required this.onRetry,
  });

  final String title;
  final List<ProductModel> products;
  final RequestState status;
  final String msg;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: title),
        SizedBox(
          height: AppSize.s200.h,
          child: SectionStateView(
            status: status,
            msg: msg,
            isEmpty: products.isEmpty,
            onRetry: onRetry,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.screenPadding.w,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, _) => SizedBox(width: AppSize.s5.w),
              itemBuilder: (_, i) =>
                  ProductCard(product: products[i], width: AppSize.s160.w),
            ),
          ),
        ),
      ],
    );
  }
}
