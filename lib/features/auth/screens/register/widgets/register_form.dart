import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import 'register_terms.dart';

/// Username, email, password, the terms line and the sign up button.
class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onRegister,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController, emailController;
  final TextEditingController passwordController;
  final VoidCallback onRegister;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppField(
            title: LocaleKeys.auth_username.tr(),
            controller: nameController,
            textInputAction: TextInputAction.next,
            validator: Validator.validateEmpty,
          ),
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
            margin: EdgeInsets.zero,
          ),
          const RegisterTerms(),
          SizedBox(height: AppSize.s30.h),
          ButtonWidget(
            title: LocaleKeys.auth_sign_up.tr(),
            isLoading: isLoading,
            onTap: onRegister,
          ),
        ],
      ),
    );
  }
}
