import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../extensions/unified_extensions.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  final String? subtitle, image;
  final ErrorType? errorStatus;
  final void Function()? onTap;
  final String? btnTitle;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomErrorWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.image,
    this.errorStatus,
    this.height,
    this.padding,
    this.onTap,
    this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            padding ??
            EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (image?.isNotEmpty == true)
              CustomImage(image, height: AppSize.s150.h)
            else
              CustomRadiusIcon(
                size: AppSize.s64.w,
                backgroundColor: errorStatus?.isNetwork == true
                    ? context.warningContainer
                    : context.errorContainer,
                child: Icon(
                  errorStatus?.isNetwork == true
                      ? Icons.wifi_off_rounded
                      : Icons.error_outline_rounded,
                  size: AppSize.s28.w,
                  color: errorStatus?.isNetwork == true
                      ? context.warningColor
                      : context.errorTextColor,
                ),
              ).center,
            AppSize.s16.h.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.bold.copyWith(fontSize: FontSize.s15),
            ),
            if (subtitle?.isNotEmpty == true) ...[
              AppSize.s6.h.verticalSpace,
              Text(
                subtitle ?? '',
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.regular.copyWith(
                  fontSize: FontSize.s12_5,
                  color: context.mediumTextColor,
                ),
              ),
            ],
            if (onTap != null) ...[
              AppSize.s20.h.verticalSpace,
              ButtonWidget(
                title: btnTitle ?? LocaleKeys.static_refresh.tr(),
                onTap: onTap,
              ),
            ],
          ],
        ).withPadding(horizontal: AppSize.s24.w),
      ),
    );
  }
}

class CustomEmptyWidget extends StatelessWidget {
  final ErrorType? errorStatus;
  final String? errorMessage;
  final VoidCallback? onTap;

  const CustomEmptyWidget({
    super.key,
    this.errorStatus = ErrorType.empty,
    this.errorMessage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            AppSize.s16.h.verticalSpace,
            Text(
              errorMessage ?? LocaleKeys.validations_there_is_no_data.tr(),
              style: context.medium.copyWith(
                fontSize: FontSize.s13,
                color: context.mediumTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            AppSize.s24.h.verticalSpace,
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
