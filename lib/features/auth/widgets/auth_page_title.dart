import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

/// Big bold title of the phone flow pages (mobile number, code).
class AuthPageTitle extends StatelessWidget {
  const AuthPageTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.s80.h, bottom: AppSize.s25.h),
      child: Text(title, style: context.bold.copyWith(fontSize: FontSize.s18)),
    );
  }
}
