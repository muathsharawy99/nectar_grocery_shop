import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';

import '../data/models/register_input_model.dart';
import '../service/register_service.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._service) : super(const RegisterState());

  final RegisterService _service;

  Future<void> register(RegisterInputModel input) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.register(input);
    final body = res.data;
    // The store API answers 200 with its own `code` (200 / 201 = created).
    final code = body?['code'];
    final created = res.success && (code == null || code == 200 || code == 201);
    if (created) {
      emit(
        state.copyWith(
          status: RequestState.done,
          msg: '${body?['message'] ?? ''}',
        ),
      );
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
