import 'package:nectaar/core/blocs/safe_cubit.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/category_model.dart';

import '../../../service/categories_service.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._service) : super(const CategoriesState());

  final CategoriesService _service;

  Future<void> getCategories() async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.getCategories();
    if (res.success) {
      final categories = CategoryModel.listFrom(res.data);
      emit(
        state.copyWith(
          status: categories.isEmpty ? RequestState.empty : RequestState.done,
          categories: categories,
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
