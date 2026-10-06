import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

import '../../../service/categories_service.dart';
import 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this._service) : super(const CategoryProductsState());

  final CategoriesService _service;

  Future<void> getProducts(String categoryId) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.getCategoryProducts(categoryId);
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
