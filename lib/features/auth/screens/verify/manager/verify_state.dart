import 'package:equatable/equatable.dart';

class VerifyState extends Equatable {
  const VerifyState({this.code = '', this.secondsLeft = 0});

  final String code;

  /// Seconds before the code can be sent again.
  final int secondsLeft;

  bool get canResend => secondsLeft == 0;

  /// `1:30`, `0:05`
  String get timerText =>
      '${secondsLeft ~/ 60}:${(secondsLeft % 60).toString().padLeft(2, '0')}';

  VerifyState copyWith({String? code, int? secondsLeft}) => VerifyState(
    code: code ?? this.code,
    secondsLeft: secondsLeft ?? this.secondsLeft,
  );

  @override
  List<Object?> get props => [code, secondsLeft];
}
