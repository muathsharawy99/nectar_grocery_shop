import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../extensions/unified_extensions.dart';

/// keyboardType drives the behaviour:
/// - [TextInputType.visiblePassword] → obscured with an eye toggle
/// - [TextInputType.phone] → digits only with the country-code prefix
///   ([phoneCode], Egypt by default)
/// - [TextInputType.number] → digits only
/// - [TextInputType.emailAddress] → email characters only
/// Passing [onTap] makes the field read only with an arrow (pickers).
class AppField extends StatefulWidget {
  final String? hintText, title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String? v)? validator;
  final bool isRequiredHint, loading, withBorder;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final String phoneCode;

  final void Function()? onTap;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor, hintColor;
  final String? initialValue;
  final double? radius;
  final Color? borderColor;
  final Color? textColor;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final void Function(String)? onFieldSubmitted;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool enabled;
  const AppField({
    super.key,
    this.hintText,
    this.controller,
    this.radius,
    this.keyboardType,
    this.margin,
    this.maxLength,
    this.validator,
    this.isRequiredHint = true,
    this.loading = false,
    this.onTap,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,
    this.hintColor,
    this.title,
    this.contentPadding,
    this.withBorder = true,
    this.initialValue,
    this.phoneCode = AppConstants.defaultPhoneCode,
    this.borderColor,
    this.textColor,
    this.autovalidateMode,
    this.inputFormatters,
    this.textDirection,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.onFieldSubmitted,
    this.textStyle,
    this.hintStyle,
    this.enabled = true,
  });

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  final _focusNode = FocusNode();

  bool showPass = false;

  bool get _isPassword => widget.keyboardType == TextInputType.visiblePassword;
  bool get _isPhone => widget.keyboardType == TextInputType.phone;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  InputBorder? _border(Color color) {
    if (!widget.withBorder) return InputBorder.none;
    if (widget.radius == null && widget.borderColor == null) return null;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.radius ?? AppSize.radiusTextField.r,
      ),
      borderSide: BorderSide(color: widget.borderColor ?? color),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget field = Semantics(
      label: widget.title ?? LocaleKeys.static_this_field.tr(),
      textField: true,
      enabled: widget.enabled,
      child: TextFormField(
        focusNode: _focusNode,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        maxLines: _isPassword ? 1 : widget.maxLines,
        enabled: widget.enabled,
        readOnly: widget.onTap != null,
        onTap: widget.enabled ? widget.onTap : null,
        obscureText: _isPassword && !showPass,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        textAlign: widget.textAlign,
        textAlignVertical: TextAlignVertical.center,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        // Phone numbers stay LTR even inside an RTL (Arabic) layout.
        textDirection:
            widget.textDirection ?? (_isPhone ? TextDirection.ltr : null),
        onFieldSubmitted: widget.onFieldSubmitted,
        autovalidateMode: widget.autovalidateMode,
        validator: widget.validator,
        inputFormatters: [
          if (_isPhone) FilteringTextInputFormatter.digitsOnly,
          if (widget.keyboardType == TextInputType.number)
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          if (widget.keyboardType == TextInputType.emailAddress)
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
          ...?widget.inputFormatters,
        ],
        style:
            widget.textStyle ??
            context.medium.copyWith(
              fontSize: FontSize.s14,
              color: widget.enabled
                  ? (widget.textColor ?? context.defaultTextColor)
                  : context.mediumTextColor,
            ),
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ?? _contentPadding(),
          hintText: widget.hintText,
          counterText: '',
          fillColor: widget.fillColor,
          filled: widget.fillColor != null ? true : null,
          hintStyle:
              widget.hintStyle ??
              (widget.hintColor != null
                  ? context.regular.copyWith(
                      fontSize: FontSize.s14,
                      color: widget.hintColor,
                    )
                  : null),
          border: _border(context.borderColor),
          enabledBorder: _border(context.borderColor),
          focusedBorder: _border(context.primaryColor),
          disabledBorder: _border(context.borderLightColor),
          prefixIcon: buildPrefixIcon(context),
          suffixIcon: buildSuffixIcon(context),
        ),
      ),
    );
    if (_isPhone) {
      // Keep the whole phone field (country prefix, digits, cursor) LTR,
      // regardless of the app's current locale direction.
      field = Directionality(textDirection: TextDirection.ltr, child: field);
    }
    return Padding(
      padding: widget.margin ?? EdgeInsets.only(bottom: AppSize.s14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null)
            Text.rich(
              TextSpan(
                text: widget.title,
                children: [
                  if (!widget.isRequiredHint) ...[
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: "(${LocaleKeys.static_optional.tr()})",
                      style: context.regular.copyWith(
                        fontSize: FontSize.s11_5,
                        color: context.hintColor,
                      ),
                    ),
                  ],
                ],
                style: context.semiBold.copyWith(
                  fontSize: FontSize.s12_5,
                  color: context.labelTextColor,
                ),
              ),
            ).withPadding(bottom: AppSize.s6.h),
          field,
        ],
      ),
    );
  }

  /// The prefix box brings its own start padding, so the text sits right
  /// next to it instead of getting the field's full start padding again.
  EdgeInsetsGeometry? _contentPadding() {
    if (!_isPhone) return null;
    return EdgeInsetsDirectional.fromSTEB(
      AppSize.s2.w,
      AppSize.s12_5.h,
      AppSize.s13.w,
      AppSize.s12_5.h,
    );
  }

  Widget? buildSuffixIcon(BuildContext context) {
    if (widget.suffixIcon != null) return widget.suffixIcon;

    Widget? icon;
    if (widget.loading) {
      icon = CustomProgress(size: AppSize.s16.w);
    } else if (widget.onTap != null) {
      icon = Icon(
        Icons.keyboard_arrow_down_rounded,
        size: AppSize.s20.w,
        color: context.hintColor,
      );
    } else if (_isPassword) {
      icon = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => showPass = !showPass),
        child: Icon(
          showPass ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          size: AppSize.s18.w,
          color: context.hintColor,
        ),
      );
    }
    if (icon == null) return null;
    // Without this the icon keeps Flutter's 48px box and pushes the text
    // away from it (and makes the field taller than the others).
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.s6.w,
        end: AppSize.s12.w,
      ),
      child: icon,
    );
  }

  Widget? buildPrefixIcon(BuildContext context) {
    if (widget.prefixIcon != null) {
      return Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppSize.s12.w,
          end: AppSize.s6.w,
        ),
        child: widget.prefixIcon,
      );
    }
    if (!_isPhone) return null;

    return Container(
      height: AppSize.textFieldHeight.h,
      padding: EdgeInsets.symmetric(horizontal: AppSize.s10.w),
      margin: EdgeInsetsDirectional.only(end: AppSize.s8.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.prefixFieldColor,
        borderRadius: BorderRadiusDirectional.horizontal(
          start: Radius.circular(
            ((widget.radius ?? AppSize.radiusTextField) - 1).r,
          ),
        ),
        border: BorderDirectional(
          end: BorderSide(color: widget.borderColor ?? context.borderColor),
        ),
      ),
      child: Text(
        '+${widget.phoneCode}',
        textDirection: TextDirection.ltr,
        style: context.semiBold.copyWith(
          fontSize: FontSize.s13,
          color: context.labelTextColor,
        ),
      ),
    );
  }
}
