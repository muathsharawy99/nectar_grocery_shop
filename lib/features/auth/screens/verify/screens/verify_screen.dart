import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../../widgets/auth_page_title.dart';
import '../../../widgets/auth_scaffold.dart';
import '../manager/verify_cubit.dart';
import '../manager/verify_state.dart';
import '../widgets/otp_code_field.dart';
import '../widgets/resend_code_button.dart';

/// The 4-digit code page (UI only): the demo code opens the location page.
class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final VerifyCubit cubit = sl<VerifyCubit>();

  @override
  void initState() {
    super.initState();
    cubit.startTimer();
  }

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _onCompleted(String _) {
    if (cubit.isCodeValid) {
      push(NamedRoutes.selectLocation);
    } else {
      FlashHelper.showToast(LocaleKeys.auth_demo_code_hint.tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCubit, VerifyState>(
      bloc: cubit,
      builder: (context, state) => AuthScaffold(
        withBack: true,
        onNext: () => push(NamedRoutes.selectLocation),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthPageTitle(title: LocaleKeys.auth_enter_code.tr()),
            SizedBox(height: AppSize.s50.h),
            OtpCodeField(
              code: state.code,
              onChanged: cubit.changeCode,
              onCompleted: _onCompleted,
            ),
            SizedBox(height: AppSize.s50.h),
            ResendCodeButton(
              timerText: state.timerText,
              canResend: state.canResend,
              onResend: cubit.resend,
            ).toStart,
          ],
        ),
      ),
    );
  }
}
