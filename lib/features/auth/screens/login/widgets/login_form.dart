import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

/// Email, password, "Forgot Password?" and the login button.
class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController, passwordController;
  final VoidCallback onLogin;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppField(
            title: LocaleKeys.auth_email.tr(),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: Validator.validateEmail,
          ),
          AppField(
            title: LocaleKeys.auth_password.tr(),
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: Validator.validateEmpty,
            onFieldSubmitted: (_) => onLogin(),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.auth_forgot_password.tr(),
              style: context.regular.copyWith(fontSize: FontSize.s14),
            ),
          ).toEnd,
          SizedBox(height: AppSize.s30.h),
          ButtonWidget(
            title: LocaleKeys.auth_login.tr(),
            isLoading: isLoading,
            onTap: onLogin,
          ),
        ],
      ),
    );
  }
}
