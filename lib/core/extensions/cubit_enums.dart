enum RequestState {
  initial,
  loading,
  done,
  error,
  empty;

  bool get isInitial => this == RequestState.initial;
  bool get isLoading => this == RequestState.loading;
  bool get isDone => this == RequestState.done;
  bool get isError => this == RequestState.error;
  bool get isEmpty => this == RequestState.empty;
}

enum ErrorType {
  network,
  server,
  backEndValidation,
  unknown,
  none,
  unAuth,
  canceled,
  empty;

  bool get isNetwork => this == ErrorType.network;
}
