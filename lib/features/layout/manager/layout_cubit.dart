import 'package:nectaar/core/blocs/safe_cubit.dart';

/// Selected bottom-navigation tab.
class LayoutCubit extends Cubit<int> {
  LayoutCubit() : super(0);

  void changeTab(int index) {
    if (index == state) return;
    emit(index);
  }
}
