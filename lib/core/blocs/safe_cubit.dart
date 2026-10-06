import 'package:flutter_bloc/flutter_bloc.dart' as bloc;

abstract class Cubit<State> extends bloc.Cubit<State> {
  Cubit(super.initialState);

  @override
  void emit(State state) {
    if (isClosed) return;
    super.emit(state);
  }
}
