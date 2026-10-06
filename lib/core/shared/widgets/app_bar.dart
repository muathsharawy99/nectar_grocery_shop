import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/context_extensions.dart';
import '../../resources/dimensions_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../utils/theme/color/light_theme_color.dart';

/// Green header used by in-app screens: back button, title, subtitle and
/// square action buttons ([AppBarAction]).
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool withBack;
  final Widget? suffixIcon;
  final List<Widget> actions;
  final VoidCallback? onBack;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.subtitle,
    this.withBack = true,
    this.suffixIcon,
    this.actions = const [],
    this.onBack,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final canBack = withBack && (ModalRoute.of(context)?.canPop ?? false);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? context.primaryColor,
          border: Border(
            bottom: BorderSide(color: LightThemeColor().appBarDividerColor),
          ),
        ),
        padding: EdgeInsetsDirectional.only(
          start: AppSize.s18.w,
          end: AppSize.s18.w,
          top: MediaQuery.paddingOf(context).top + AppSize.s8.h,
          bottom: AppSize.s12.h,
        ),
        child: SizedBox(
          height: AppSize.s44.h,
          child: Row(
            children: [
              if (canBack) ...[
                AppBarAction(
                  icon: Icons.arrow_back_rounded,
                  onTap: onBack ?? () => Navigator.maybePop(context),
                ),
                SizedBox(width: AppSize.s12.w),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.bold.copyWith(
                        fontSize: FontSize.s17,
                        color: context.onPrimary,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.regular.copyWith(
                          fontSize: FontSize.s11,
                          color: LightThemeColor().appBarSubtitleColor,
                        ),
                      ),
                  ],
                ),
              ),
              for (final action in actions) ...[
                SizedBox(width: AppSize.s8.w),
                action,
              ],
              if (suffixIcon != null) ...[
                SizedBox(width: AppSize.s8.w),
                suffixIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppSize.s8.h + AppSize.s44.h + AppSize.s12.h + 1);
}

/// Square translucent header button with an optional counter badge.
/// Takes a material [icon] or an svg asset [svgIcon] (tinted white).
class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
    this.icon,
    this.svgIcon,
    required this.onTap,
    this.badgeCount = 0,
  }) : assert(icon != null || svgIcon != null);

  final IconData? icon;
  final String? svgIcon;
  final VoidCallback onTap;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: LightThemeColor().appBarActionColor,
          borderRadius: BorderRadius.circular(AppSize.s8.r),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: SizedBox.square(
              dimension: AppSize.appBarActionSize.w,
              child: Center(
                child: svgIcon != null
                    ? SvgPicture.asset(
                        svgIcon!,
                        width: AppSize.s17.w,
                        height: AppSize.s17.w,
                        colorFilter: ColorFilter.mode(
                          context.onPrimary,
                          BlendMode.srcIn,
                        ),
                      )
                    : Icon(icon, color: context.onPrimary, size: AppSize.s17.w),
              ),
            ),
          ),
        ),
        if (badgeCount > 0)
          PositionedDirectional(
            top: -AppSize.s4.h,
            end: -AppSize.s4.w,
            child: Container(
              constraints: BoxConstraints(
                minWidth: AppSize.s17.w,
                minHeight: AppSize.s17.w,
              ),
              padding: EdgeInsets.symmetric(horizontal: AppSize.s4.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.notificationDotColor,
                borderRadius: BorderRadius.circular(AppSize.radiusFull.r),
                border: Border.all(
                  color: context.primaryColor,
                  width: AppSize.s1_5,
                ),
              ),
              child: Text(
                badgeCount > 99 ? '99+' : '$badgeCount',
                style: context.bold.copyWith(
                  fontSize: FontSize.s9_5,
                  color: context.onPrimary,
                  height: 1,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
