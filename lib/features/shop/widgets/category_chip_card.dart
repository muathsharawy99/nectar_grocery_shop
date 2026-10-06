import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Wide tinted category tile of the shop tab ("Groceries" row).
class CategoryChipCard extends StatelessWidget {
  const CategoryChipCard({
    super.key,
    required this.category,
    required this.color,
    required this.onTap,
  });

  final CategoryModel category;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: .5),
      borderRadius: BorderRadius.circular(AppSize.borderRadius.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: AppSize.s230.w,
          child: Row(
            children: [
              CustomImage(Assets.images.banana.path).expand(flex: 3),
              SizedBox(width: AppSize.s15.w),
              Text(
                category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.semiBold.copyWith(
                  fontSize: FontSize.s18,
                  height: 1,
                ),
              ).expand(flex: 5),
            ],
          ).withPadding(all: AppSize.s10.w),
        ),
      ),
    );
  }
}
