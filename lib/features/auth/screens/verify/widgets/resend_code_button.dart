import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// "Resend Code" with the countdown next to it.
class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    super.key,
    required this.timerText,
    required this.canResend,
    required this.onResend,
  });

  final String timerText;
  final bool canResend;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: canResend ? onResend : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.auth_resend_code.tr(),
            style: context.medium.copyWith(
              fontSize: FontSize.s15,
              color: canResend
                  ? context.primaryColor
                  : context.mutedTextColor,
            ),
          ),
          if (!canResend) ...[
            SizedBox(width: AppSize.s10.w),
            Text(
              timerText,
              style: context.regular.copyWith(fontSize: FontSize.s14),
            ),
          ],
        ],
      ),
    );
  }
}
