import 'package:equatable/equatable.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/product_model.dart';

class CartState extends Equatable {
  const CartState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.items = const [],
    this.quantities = const {},
    this.addStatus = RequestState.initial,
    this.addMsg = '',
  });

  /// Loading the cart.
  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final List<ProductModel> items;

  /// Quantity picked per cart line (product id → quantity), UI only.
  final Map<String, int> quantities;

  /// Adding a product to the cart.
  final RequestState addStatus;
  final String addMsg;

  int quantityOf(String id) => quantities[id] ?? 1;

  CartState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    List<ProductModel>? items,
    Map<String, int>? quantities,
    RequestState? addStatus,
    String? addMsg,
  }) => CartState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    items: items ?? this.items,
    quantities: quantities ?? this.quantities,
    addStatus: addStatus ?? this.addStatus,
    addMsg: addMsg ?? this.addMsg,
  );

  @override
  List<Object?> get props => [
    status,
    msg,
    errorType,
    items,
    quantities,
    addStatus,
    addMsg,
  ];
}
