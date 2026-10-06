import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Square tinted category tile of the categories grid.
class CategoryCard extends StatelessWidget {
  const CategoryCard({
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
    final radius = BorderRadius.circular(AppSize.borderRadius.r);
    return Material(
      color: color.withValues(alpha: .2),
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(color: color),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            CustomImage(Assets.images.banana.path).expand(flex: 3),
            SizedBox(height: AppSize.s20.h),
            Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.bold.copyWith(fontSize: FontSize.s12, height: 1),
            ).expand(),
          ],
        ).withPadding(all: AppSize.s10.w),
      ),
    );
  }
}
