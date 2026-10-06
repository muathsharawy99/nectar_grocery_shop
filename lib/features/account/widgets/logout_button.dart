import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// Grey "Log Out" button with the green icon.
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      title: LocaleKeys.account_logout.tr(),
      buttonColor: context.surfaceVariant,
      textColor: context.primaryColor,
      withShadow: false,
      onTap: onTap,
    ).withPadding(horizontal: AppSize.s20.w);
  }
}
