import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/blocs/cart/manager/cart_cubit.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../../widgets/auth_header.dart';
import '../../../widgets/auth_scaffold.dart';
import '../../../widgets/auth_switch_row.dart';
import '../data/models/login_input_model.dart';
import '../manager/login_cubit.dart';
import '../manager/login_state.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginCubit cubit = sl<LoginCubit>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _onLogin() {
    if (!_formKey.isValid) return;
    cubit.login(
      LoginInputModel(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) {
        if (state.status.isDone) {
          sl<CartCubit>().reset();
          pushAndRemoveUntil(NamedRoutes.home);
        } else if (state.status.isError) {
          FlashHelper.showToast(
            state.msg.isNotEmpty
                ? state.msg
                : LocaleKeys.something_went_wrong_please_try_again.tr(),
          );
        }
      },
      builder: (context, state) => AuthScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthHeader(
              title: LocaleKeys.auth_login.tr(),
              subtitle: LocaleKeys.auth_login_subtitle.tr(),
            ),
            LoginForm(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              onLogin: _onLogin,
              isLoading: state.status.isLoading,
            ),
            SizedBox(height: AppSize.s15.h),
            AuthSwitchRow(
              text: LocaleKeys.auth_no_account.tr(),
              action: LocaleKeys.auth_sign_up.tr(),
              onTap: () => push(NamedRoutes.register),
            ),
          ],
        ),
      ),
    );
  }
}
