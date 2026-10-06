import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

import '../service/product_details_service.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._service) : super(ProductDetailsState());

  final ProductDetailsService _service;

  Future<void> getProduct(String id) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.getProduct(id);
    final raw = res.data?['data'];
    if (res.success && raw is Map) {
      emit(
        state.copyWith(
          status: RequestState.done,
          product: ProductModel.fromJson(Map<String, dynamic>.from(raw)),
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestState.error,
          msg: res.msg,
          errorType: res.success ? ErrorType.empty : res.errType,
        ),
      );
    }
  }

  void increment() => emit(state.copyWith(quantity: state.quantity + 1));

  void decrement() {
    if (state.quantity > 1) emit(state.copyWith(quantity: state.quantity - 1));
  }

  void toggleFavorite() =>
      emit(state.copyWith(isFavorite: !state.isFavorite));

  void toggleDetails() =>
      emit(state.copyWith(showDetails: !state.showDetails));

  void rate(double rating) => emit(state.copyWith(rating: rating));
}
