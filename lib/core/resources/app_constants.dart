import 'package:flutter/material.dart';

class AppConstants {
  /// The design frame the old screens were drawn on.
  static const Size appSize = Size(360, 690);
  static const otpLength = 4;
  static const otpResendSeconds = 90;
  static const defaultPhoneCode = '20';

  /// UI-only OTP until the phone sign in is connected to the API.
  static const demoOtp = '1234';
  static const splashDuration = Duration(milliseconds: 2500);
  static const bannerInterval = Duration(seconds: 4);
}
