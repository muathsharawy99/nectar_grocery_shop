import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  static final _log = LoggerDebug(constTitle: 'BlocObserver');

  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) _log.green('CREATE: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) _log.red('CLOSE: ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      _log.red('ERROR in ${bloc.runtimeType}: $error');
      _log.red('$stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      _log.yellow('EVENT: ${bloc.runtimeType} | ${event.runtimeType}');
    }
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      _log.cyan(
        'TRANSITION: ${bloc.runtimeType} | Event: ${transition.event.runtimeType}',
      );
      _log.cyan('  From: ${transition.currentState}');
      _log.cyan('  To:   ${transition.nextState}');
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode && bloc is Cubit) {
      _log.blue('CHANGE: ${bloc.runtimeType}');
      _log.blue('  From: ${change.currentState}');
      _log.blue('  To:   ${change.nextState}');
    }
    super.onChange(bloc, change);
  }
}
