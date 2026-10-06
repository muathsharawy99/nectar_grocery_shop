import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// Bottom sheet frame from the design (top radius 26, handle, optional
/// title and close button). Show it with `showAppSheet(CustomAppSheet(...))`.
///
/// It is at most [maxHeightFactor] of the screen (76% like the design);
/// longer content scrolls inside. [header] stays fixed above the scrolling
/// [children] (e.g. a note or a search field) and [footer] fixed below them
/// (e.g. the sheet's buttons).
class CustomAppSheet extends StatefulWidget {
  final String? title;
  final List<Widget>? children;
  final List<Widget>? header, footer;
  final EdgeInsetsGeometry? padding;
  final bool? hasCloseButton, hideMiddleSpace, crossStart;
  final double maxHeightFactor;

  const CustomAppSheet({
    super.key,
    this.title,
    this.hasCloseButton,
    this.hideMiddleSpace,
    this.children,
    this.header,
    this.footer,
    this.crossStart = false,
    this.padding,
    this.maxHeightFactor = .76,
  });

  @override
  State<CustomAppSheet> createState() => _CustomAppSheetState();
}

class _CustomAppSheetState extends State<CustomAppSheet> {
  @override
  Widget build(BuildContext context) {
    final hasTitle = widget.title?.isNotEmpty ?? false;
    final hasFooter = widget.footer?.isNotEmpty ?? false;
    final crossAxis = widget.crossStart == true
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: context.h * widget.maxHeightFactor,
        ),
        decoration: BoxDecoration(
          color: context.surfacesColor,
          borderRadius: BorderRadiusDirectional.vertical(
            top: Radius.circular(AppSize.radiusSheet.r),
          ),
          boxShadow: ShadowStyles.sheet,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: widget.crossStart == false
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              if (widget.hideMiddleSpace != true)
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: AppSize.s10.h),
                    height: AppSize.s4.h,
                    width: AppSize.s42.w,
                    decoration: BoxDecoration(
                      color: context.controlBorderColor,
                      borderRadius: BorderRadius.circular(AppSize.radiusFull.r),
                    ),
                  ),
                ),
              if (hasTitle || widget.hasCloseButton == true)
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? "",
                        style: context.bold.copyWith(fontSize: FontSize.s16),
                      ),
                    ),
                    if (widget.hasCloseButton == true)
                      CustomRadiusIcon(
                        size: AppSize.s30.w,
                        backgroundColor: context.surfaceVariant,
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close_rounded,
                          size: AppSize.s16.w,
                          color: context.regularTextColor,
                        ),
                      ),
                  ],
                ).withPadding(
                  horizontal: AppSize.s18.w,
                  top: AppSize.s14.h,
                  bottom: AppSize.s4.h,
                ),
              if (widget.header?.isNotEmpty ?? false)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppSize.s18.w,
                    AppSize.s12.h,
                    AppSize.s18.w,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: crossAxis,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.header!,
                  ),
                ),
              Flexible(
                child: Padding(
                  padding:
                      widget.padding ??
                      EdgeInsets.fromLTRB(
                        AppSize.s18.w,
                        AppSize.s12.h,
                        AppSize.s18.w,
                        hasFooter ? AppSize.s12.h : AppSize.s18.h,
                      ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: crossAxis,
                      mainAxisSize: MainAxisSize.min,
                      children: widget.children ?? [],
                    ),
                  ),
                ),
              ),
              if (hasFooter)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppSize.s18.w,
                    0,
                    AppSize.s18.w,
                    AppSize.s18.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.footer!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
