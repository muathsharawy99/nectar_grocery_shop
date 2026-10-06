import 'package:equatable/equatable.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/category_model.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

class ShopState extends Equatable {
  const ShopState({
    this.productsStatus = RequestState.initial,
    this.productsMsg = '',
    this.products = const [],
    this.categoriesStatus = RequestState.initial,
    this.categoriesMsg = '',
    this.categories = const [],
  });

  final RequestState productsStatus;
  final String productsMsg;
  final List<ProductModel> products;

  final RequestState categoriesStatus;
  final String categoriesMsg;
  final List<CategoryModel> categories;

  ShopState copyWith({
    RequestState? productsStatus,
    String? productsMsg,
    List<ProductModel>? products,
    RequestState? categoriesStatus,
    String? categoriesMsg,
    List<CategoryModel>? categories,
  }) => ShopState(
    productsStatus: productsStatus ?? this.productsStatus,
    productsMsg: productsMsg ?? this.productsMsg,
    products: products ?? this.products,
    categoriesStatus: categoriesStatus ?? this.categoriesStatus,
    categoriesMsg: categoriesMsg ?? this.categoriesMsg,
    categories: categories ?? this.categories,
  );

  @override
  List<Object?> get props => [
    productsStatus,
    productsMsg,
    products,
    categoriesStatus,
    categoriesMsg,
    categories,
  ];
}
