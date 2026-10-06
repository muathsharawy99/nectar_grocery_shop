import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Vegetables photo with the small nectar logo on its top end.
class PhoneSignInHeader extends StatelessWidget {
  const PhoneSignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(Assets.images.vegets.path, height: AppSize.s280.h),
        PositionedDirectional(
          end: AppSize.s30.w,
          top: AppSize.s10.h + context.statusBarHeight,
          child: CustomImage(Assets.images.nectarLogo.path),
        ),
      ],
    ).toEnd;
  }
}
