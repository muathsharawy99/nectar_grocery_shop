import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/components/splash.dart';
import 'package:nectaar/view/screens/home_screen.dart';
import 'package:nectaar/view/screens/onboard/onboard_screen.dart';
import 'package:nectaar/view_model/local/shared_preferences/shared_preferences.dart';
import 'package:nectaar/view_model/local/shared_preferences/shared_preferences_key.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: ColorAssets.green,
      nextScreen: SharedPreference.get(SharedKeys.token) == null ? OnboardScreen() : HomeScreen(),
      splash: SplashCustom(),
      splashIconSize: 50.w,
      centered: true,

    );
  }
}
