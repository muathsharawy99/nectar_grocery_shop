import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/category_model.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

import '../service/shop_service.dart';
import 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this._service) : super(const ShopState());

  final ShopService _service;

  Future<void> load() => Future.wait([getProducts(), getCategories()]);

  Future<void> getProducts() async {
    emit(
      state.copyWith(productsStatus: RequestState.loading, productsMsg: ''),
    );
    final res = await _service.getProducts();
    if (res.success) {
      emit(
        state.copyWith(
          productsStatus: RequestState.done,
          products: ProductModel.listFrom(res.data),
        ),
      );
    } else {
      emit(
        state.copyWith(
          productsStatus: RequestState.error,
          productsMsg: res.msg,
        ),
      );
    }
  }

  Future<void> getCategories() async {
    emit(
      state.copyWith(
        categoriesStatus: RequestState.loading,
        categoriesMsg: '',
      ),
    );
    final res = await _service.getCategories();
    if (res.success) {
      emit(
        state.copyWith(
          categoriesStatus: RequestState.done,
          categories: CategoryModel.listFrom(res.data),
        ),
      );
    } else {
      emit(
        state.copyWith(
          categoriesStatus: RequestState.error,
          categoriesMsg: res.msg,
        ),
      );
    }
  }
}
