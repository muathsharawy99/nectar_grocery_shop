import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/logger.dart';

/// Logs cubit lifecycles and state changes in debug builds.
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
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      _log.blue('CHANGE: ${bloc.runtimeType}');
      _log.blue('  From: ${change.currentState}');
      _log.blue('  To:   ${change.nextState}');
    }
    super.onChange(bloc, change);
  }
}
