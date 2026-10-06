import 'package:equatable/equatable.dart';
import 'package:nectaar/core/extensions/cubit_enums.dart';
import 'package:nectaar/core/shared/models/category_model.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.categories = const [],
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final List<CategoryModel> categories;

  CategoriesState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    List<CategoryModel>? categories,
  }) => CategoriesState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    categories: categories ?? this.categories,
  );

  @override
  List<Object?> get props => [status, msg, errorType, categories];
}
