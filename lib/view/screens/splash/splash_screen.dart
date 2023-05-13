import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/components/splash.dart';
import 'package:nectaar/view/screens/onboard/onboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: ColorAssets.green,
      nextScreen: OnboardScreen(),
      splash: SplashCustom(),
      splashIconSize: 50.w,
      centered: true,

    );
  }
}
