import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/user_model.dart';

import '../data/models/login_input_model.dart';
import '../service/login_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._service) : super(const LoginState());

  final LoginService _service;

  Future<void> login(LoginInputModel input) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.login(input);
    final body = res.data;
    // The store API answers 200 with its own `code` (200 / 201 = signed in).
    final code = body?['code'];
    if (res.success && (code == 200 || code == 201)) {
      final raw = body?['data'];
      UserModel.i.fromJson({
        if (raw is Map) ...Map<String, dynamic>.from(raw),
        'token': body?['token'],
      });
      await UserModel.i.save();
      emit(state.copyWith(status: RequestState.done));
    } else {
      emit(
        state.copyWith(
          status: RequestState.error,
          msg: res.success ? '${body?['message'] ?? ''}' : res.msg,
          errorType: res.success ? ErrorType.backEndValidation : res.errType,
        ),
      );
    }
  }
}
