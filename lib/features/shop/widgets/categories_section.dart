import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

import 'category_chip_card.dart';
import 'section_state_view.dart';

/// Section title ("See all" → all categories) + horizontal category tiles.
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.title,
    required this.categories,
    required this.status,
    required this.msg,
    required this.onRetry,
  });

  final String title;
  final List<CategoryModel> categories;
  final RequestState status;
  final String msg;
  final VoidCallback onRetry;

  void _openCategory(CategoryModel category) => push(
    NamedRoutes.categoryProducts,
    arg: {RouteString.id: category.id, RouteString.name: category.name},
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: title,
          onSeeAll: () => push(NamedRoutes.categories),
        ),
        SizedBox(
          height: AppSize.s85.h,
          child: SectionStateView(
            status: status,
            msg: msg,
            isEmpty: categories.isEmpty,
            onRetry: onRetry,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.screenPadding.w,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, _) => SizedBox(width: AppSize.s5.w),
              itemBuilder: (context, i) => CategoryChipCard(
                category: categories[i],
                color: context.categoryColor(i),
                onTap: () => _openCategory(categories[i]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
