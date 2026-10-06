import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

import '../service/explore_service.dart';
import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._service) : super(const ExploreState());

  final ExploreService _service;

  Future<void> getProducts() async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.getProducts();
    if (res.success) {
      final products = ProductModel.listFrom(res.data);
      emit(
        state.copyWith(
          status: products.isEmpty ? RequestState.empty : RequestState.done,
          products: products,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestState.error,
          msg: res.msg,
          errorType: res.errType,
        ),
      );
    }
  }
}
