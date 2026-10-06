import 'package:flutter/material.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

/// "Don't have an account? Sign Up" row under the auth forms.
class AuthSwitchRow extends StatelessWidget {
  const AuthSwitchRow({
    super.key,
    required this.text,
    required this.action,
    required this.onTap,
  });

  final String text, action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: context.regular.copyWith(fontSize: FontSize.s14)),
        TextButton(
          onPressed: onTap,
          child: Text(
            action,
            style: context.semiBold.copyWith(
              fontSize: FontSize.s14,
              color: context.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
