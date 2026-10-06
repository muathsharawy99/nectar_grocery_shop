import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

import '../widgets/onboarding_content.dart';

/// Full-screen photo with the welcome text and "Get Started" → login.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomImage(
            Assets.images.man.path,
            fit: BoxFit.cover,
            width: double.infinity,
            height: context.h,
          ),
          PositionedDirectional(
            bottom: AppSize.s30.h,
            start: AppSize.s30.w,
            end: AppSize.s30.w,
            child: OnboardingContent(
              onStart: () => pushAndRemoveUntil(NamedRoutes.login),
            ),
          ),
        ],
      ),
    );
  }
}
