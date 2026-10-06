import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

/// [AppConstants.otpLength] boxes over one hidden number field.
class OtpCodeField extends StatefulWidget {
  const OtpCodeField({
    super.key,
    required this.code,
    required this.onChanged,
    required this.onCompleted,
  });

  final String code;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;

  @override
  State<OtpCodeField> createState() => _OtpCodeFieldState();
}

class _OtpCodeFieldState extends State<OtpCodeField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    widget.onChanged(value);
    if (value.length == AppConstants.otpLength) widget.onCompleted(value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Invisible field that owns the keyboard and the typed digits.
        Opacity(
          opacity: 0,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: true,
            keyboardType: TextInputType.number,
            maxLength: AppConstants.otpLength,
            showCursor: false,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: _onChanged,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < AppConstants.otpLength; i++)
              _OtpBox(
                digit: i < widget.code.length ? widget.code[i] : '',
                isActive: i == widget.code.length,
              ),
          ],
        ).onTap(_focusNode.requestFocus),
      ],
    );
  }
}

class _OtpBox extends StatelessWidget {
  const _OtpBox({required this.digit, required this.isActive});

  final String digit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s40.w,
      height: AppSize.s50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: digit.isEmpty ? context.surfacesColor : context.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSize.s4.r),
        border: Border.all(
          color: isActive ? context.primaryColor : context.borderStrongColor,
        ),
      ),
      child: Text(digit, style: context.semiBold.copyWith(fontSize: FontSize.s18)),
    );
  }
}
