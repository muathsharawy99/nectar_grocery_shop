import 'dart:async';

import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/resources/app_constants.dart';

import 'verify_state.dart';

/// The 4-digit code page (UI only until the phone sign in has an API):
/// the typed code and the resend countdown.
class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(const VerifyState());

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    emit(state.copyWith(secondsLeft: AppConstants.otpResendSeconds));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final left = state.secondsLeft - 1;
      emit(state.copyWith(secondsLeft: left < 0 ? 0 : left));
      if (left <= 0) timer.cancel();
    });
  }

  void resend() {
    if (state.canResend) startTimer();
  }

  void changeCode(String code) => emit(state.copyWith(code: code));

  bool get isCodeValid => state.code == AppConstants.demoOtp;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
