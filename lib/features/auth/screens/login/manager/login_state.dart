import 'package:equatable/equatable.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;

  LoginState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
  }) => LoginState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
  );

  @override
  List<Object?> get props => [status, msg, errorType];
}
