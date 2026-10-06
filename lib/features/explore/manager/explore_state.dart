import 'package:equatable/equatable.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

class ExploreState extends Equatable {
  const ExploreState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.products = const [],
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final List<ProductModel> products;

  ExploreState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    List<ProductModel>? products,
  }) => ExploreState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    products: products ?? this.products,
  );

  @override
  List<Object?> get props => [status, msg, errorType, products];
}
