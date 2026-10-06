import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../extensions/unified_extensions.dart';

/// keyboardType drives the behaviour:
/// - [TextInputType.visiblePassword] → obscured with an eye toggle
/// - [TextInputType.emailAddress] → email characters only
class AppField extends StatefulWidget {
  final String? hintText, title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String? v)? validator;
  final Widget? prefixIcon;
  final Color? fillColor;
  final double? radius;
  final Color? borderColor;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  const AppField({
    super.key,
    this.hintText,
    this.title,
    this.controller,
    this.keyboardType,
    this.margin,
    this.contentPadding,
    this.validator,
    this.prefixIcon,
    this.fillColor,
    this.radius,
    this.borderColor,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  bool showPass = false;

  bool get _isPassword => widget.keyboardType == TextInputType.visiblePassword;

  /// A box border only when a radius / color is given; otherwise the
  /// theme's underline.
  InputBorder? _border(Color color) {
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
    final field = Semantics(
      label: widget.title ?? LocaleKeys.static_this_field.tr(),
      textField: true,
      child: TextFormField(
        maxLines: 1,
        obscureText: _isPassword && !showPass,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: widget.keyboardType,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        inputFormatters: [
          if (widget.keyboardType == TextInputType.emailAddress)
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
        ],
        style: context.medium.copyWith(
          fontSize: FontSize.s14,
          color: context.defaultTextColor,
        ),
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null ? true : null,
          border: _border(context.borderColor),
          enabledBorder: _border(context.borderColor),
          focusedBorder: _border(context.primaryColor),
          prefixIcon: _prefixIcon(),
          suffixIcon: _suffixIcon(context),
        ),
      ),
    );
    return Padding(
      padding: widget.margin ?? EdgeInsets.only(bottom: AppSize.s14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: context.semiBold.copyWith(
                fontSize: FontSize.s12_5,
                color: context.labelTextColor,
              ),
            ).withPadding(bottom: AppSize.s6.h),
          field,
        ],
      ),
    );
  }

  Widget? _prefixIcon() {
    if (widget.prefixIcon == null) return null;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.s12.w,
        end: AppSize.s6.w,
      ),
      child: widget.prefixIcon,
    );
  }

  Widget? _suffixIcon(BuildContext context) {
    if (!_isPassword) return null;
    // Without the padding the icon keeps Flutter's 48px box and pushes the
    // text away from it.
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.s6.w,
        end: AppSize.s12.w,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => showPass = !showPass),
        child: Icon(
          showPass ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          size: AppSize.s18.w,
          color: context.hintColor,
        ),
      ),
    );
  }
}
