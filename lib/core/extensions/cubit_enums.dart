enum RequestState {
  initial,
  loading,
  done,
  error,
  empty;

  bool get isLoading => this == RequestState.loading;

  bool get isDone => this == RequestState.done;

  bool get isError => this == RequestState.error;

  bool get isInitial => this == RequestState.initial;
  bool get isEmpty => this == RequestState.empty;

  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function() success,
    required T Function() error,
    required T Function() empty,
  }) {
    switch (this) {
      case RequestState.initial:
        return initial();
      case RequestState.loading:
        return loading();
      case RequestState.done:
        return success();
      case RequestState.error:
        return error();
      case RequestState.empty:
        return empty();
    }
  }

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function()? success,
    T Function()? error,
    T Function()? empty,
    required T Function() orElse,
  }) {
    switch (this) {
      case RequestState.initial:
        if (initial != null) {
          return initial();
        }
        break;
      case RequestState.loading:
        if (loading != null) {
          return loading();
        }
        break;
      case RequestState.done:
        if (success != null) {
          return success();
        }
        break;
      case RequestState.error:
        if (error != null) {
          return error();
        }
        break;
      case RequestState.empty:
        if (empty != null) {
          return empty();
        }
        break;
    }
    return orElse();
  }
}

enum ErrorType {
  network,
  server,
  backEndValidation,
  unknown,
  none,
  unAuth,
  canceled,
  emptyLocation,
  emptyNotification,
  empty;

  bool get isNetwork => this == ErrorType.network;

  bool get isServer => this == ErrorType.server;
  bool get isEmptyNotification => this == ErrorType.emptyNotification;

  bool get isBackEndValidation => this == ErrorType.backEndValidation;

  bool get isUnknown => this == ErrorType.unknown;

  bool get isEmpty => this == ErrorType.empty;

  bool get isUnAuth => this == ErrorType.unAuth;

  bool get isNone => this == ErrorType.none;
  bool get location => this == ErrorType.emptyLocation;
}
