import 'package:equatable/equatable.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

class ProductDetailsState extends Equatable {
  ProductDetailsState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    ProductModel? product,
    this.quantity = 1,
    this.isFavorite = false,
    this.showDetails = false,
    this.rating = 3,
  }) : product = product ?? ProductModel.fromJson();

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final ProductModel product;

  /// Quantity to add to the basket (at least 1).
  final int quantity;

  /// UI only until favorites have an API.
  final bool isFavorite;

  /// "Product Detail" section expanded.
  final bool showDetails;

  /// UI only until reviews have an API.
  final double rating;

  ProductDetailsState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    ProductModel? product,
    int? quantity,
    bool? isFavorite,
    bool? showDetails,
    double? rating,
  }) => ProductDetailsState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    isFavorite: isFavorite ?? this.isFavorite,
    showDetails: showDetails ?? this.showDetails,
    rating: rating ?? this.rating,
  );

  @override
  List<Object?> get props => [
    status,
    msg,
    errorType,
    product,
    product.name,
    quantity,
    isFavorite,
    showDetails,
    rating,
  ];
}
