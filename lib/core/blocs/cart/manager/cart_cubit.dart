import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

import '../service/cart_service.dart';
import 'cart_state.dart';

/// The signed-in user's cart, shared by the cart tab and the product
/// details "Add To Basket" button (registered as a lazy singleton).
class CartCubit extends Cubit<CartState> {
  CartCubit(this._service) : super(const CartState());

  final CartService _service;

  Future<void> getCart() async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.getCart();
    if (res.success) {
      emit(
        state.copyWith(
          status: RequestState.done,
          items: ProductModel.listFrom(res.data),
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

  Future<void> addToCart({required String id, required int quantity}) async {
    emit(state.copyWith(addStatus: RequestState.loading, addMsg: ''));
    final res = await _service.addToCart(id: id, quantity: quantity);
    if (res.success) {
      emit(state.copyWith(addStatus: RequestState.done, addMsg: res.msg));
      getCart();
    } else {
      emit(state.copyWith(addStatus: RequestState.error, addMsg: res.msg));
    }
  }

  void increment(String id) => _setQuantity(id, state.quantityOf(id) + 1);

  void decrement(String id) {
    if (state.quantityOf(id) > 1) _setQuantity(id, state.quantityOf(id) - 1);
  }

  void _setQuantity(String id, int quantity) =>
      emit(state.copyWith(quantities: {...state.quantities, id: quantity}));

  /// On logout: the next user starts with an empty cart.
  void reset() => emit(const CartState());
}
