import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';
import '../../utils/theme/color/light_theme_color.dart';

enum MessageType { success, fail, warning }

/// Dark floating toast from the design (colored dot + message).
class FlashHelper {
  static Future<void> showToast(
    String msg, {
    int duration = 3,
    MessageType type = MessageType.fail,
  }) async {
    final context = navigator.currentContext;
    if (msg.trim().isEmpty || context == null) return;
    return showFlash(
      context: context,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          position: FlashPosition.bottom,
          behavior: FlashBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(
            horizontal: AppSize.s16.w,
            vertical: AppSize.s24.h,
          ),
          content: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.s16.w,
              vertical: AppSize.s12.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              color: LightThemeColor().toastColor,
              boxShadow: ShadowStyles.toast,
            ),
            child: Row(
              children: [
                Container(
                  width: AppSize.s8.w,
                  height: AppSize.s8.w,
                  decoration: BoxDecoration(
                    color: _getDotColor(type),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: AppSize.s10.w),
                Expanded(
                  child: Text(
                    msg,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: context.medium.copyWith(
                      fontSize: FontSize.s12_5,
                      color: context.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: Duration(seconds: duration),
    );
  }

  static Color _getDotColor(MessageType msgType) {
    switch (msgType) {
      case MessageType.success:
        return LightThemeColor().toastSuccessDot;
      case MessageType.warning:
        return LightThemeColor().secondary;
      default:
        return LightThemeColor().toastErrorDot;
    }
  }
}
