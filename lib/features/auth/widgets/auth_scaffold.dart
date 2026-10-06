import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Auth page frame: the soft colored top background behind the scrolling
/// form. The scroll is reversed so the form bottom stays above the keyboard.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(
          children: [
            CustomImage(
              Assets.images.topColor.path,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.screenPadding.w,
                vertical: AppSize.s10.h,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
