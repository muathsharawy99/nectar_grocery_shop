import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../extensions/unified_extensions.dart';

/// Full-page error with an icon (wifi-off for network errors), the message
/// and a refresh button.
class CustomErrorWidget extends StatelessWidget {
  final String title;
  final ErrorType? errorStatus;
  final void Function()? onTap;

  const CustomErrorWidget({
    super.key,
    required this.title,
    this.errorStatus,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isNetwork = errorStatus?.isNetwork == true;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomRadiusIcon(
            size: AppSize.s64.w,
            backgroundColor: isNetwork
                ? context.warningContainer
                : context.errorContainer,
            child: Icon(
              isNetwork ? Icons.wifi_off_rounded : Icons.error_outline_rounded,
              size: AppSize.s28.w,
              color: isNetwork ? context.warningColor : context.errorTextColor,
            ),
          ).center,
          SizedBox(height: AppSize.s16.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.bold.copyWith(fontSize: FontSize.s15),
          ),
          if (onTap != null) ...[
            SizedBox(height: AppSize.s20.h),
            ButtonWidget(title: LocaleKeys.static_refresh.tr(), onTap: onTap),
          ],
        ],
      ).withPadding(horizontal: AppSize.s24.w),
    );
  }
}

/// "Nothing here" message with an optional refresh button.
class CustomEmptyWidget extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onTap;

  const CustomEmptyWidget({super.key, this.errorMessage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CustomRadiusIcon(
              size: AppSize.s64.w,
              backgroundColor: context.surfaceVariant,
              child: Icon(
                Icons.inbox_outlined,
                size: AppSize.s28.w,
                color: context.mutedTextColor,
              ),
            ),
            SizedBox(height: AppSize.s16.h),
            Text(
              errorMessage ?? LocaleKeys.validations_there_is_no_data.tr(),
              style: context.medium.copyWith(
                fontSize: FontSize.s13,
                color: context.mediumTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.s24.h),
            if (onTap != null)
              SizedBox(
                width: 0.5.sw,
                child: ButtonWidget(
                  title: LocaleKeys.static_refresh.tr(),
                  buttonLook: ButtonLook.border,
                  onTap: onTap,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
