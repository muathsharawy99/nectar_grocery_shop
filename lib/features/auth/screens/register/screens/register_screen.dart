import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../../widgets/auth_header.dart';
import '../../../widgets/auth_scaffold.dart';
import '../../../widgets/auth_switch_row.dart';
import '../data/models/register_input_model.dart';
import '../manager/register_cubit.dart';
import '../manager/register_state.dart';
import '../widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterCubit cubit = sl<RegisterCubit>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _onRegister() {
    if (!_formKey.isValid) return;
    cubit.register(
      RegisterInputModel(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      bloc: cubit,
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) {
        if (state.status.isDone) {
          FlashHelper.showToast(
            state.msg.isNotEmpty ? state.msg : LocaleKeys.auth_registered.tr(),
            type: MessageType.success,
          );
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
              title: LocaleKeys.auth_sign_up.tr(),
              subtitle: LocaleKeys.auth_sign_up_subtitle.tr(),
            ),
            RegisterForm(
              formKey: _formKey,
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              onRegister: _onRegister,
              isLoading: state.status.isLoading,
            ),
            SizedBox(height: AppSize.s15.h),
            AuthSwitchRow(
              text: LocaleKeys.auth_have_account.tr(),
              action: LocaleKeys.auth_login.tr(),
              onTap: () => Navigator.maybePop(context),
            ),
          ],
        ),
      ),
    );
  }
}
