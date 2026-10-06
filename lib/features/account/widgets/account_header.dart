import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Avatar, name (with edit icon) and email of the signed-in user.
class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key, required this.name, required this.email});

  final String name, email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImage(
          Assets.images.m.path,
          width: AppSize.s80.w,
          height: AppSize.s80.w,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(AppSize.radiusFull.r),
        ),
        SizedBox(width: AppSize.s10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bold.copyWith(fontSize: FontSize.s20),
                ).flexible(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mode_edit_outlined,
                    color: context.primaryColor,
                  ),
                ),
              ],
            ),
            Text(
              email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.regular.copyWith(
                fontSize: FontSize.s15,
                color: context.mediumTextColor,
              ),
            ),
          ],
        ).expand(),
      ],
    );
  }
}
