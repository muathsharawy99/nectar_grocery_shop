abstract class HomeState {}

class InitState extends HomeState {}


class ChangeLayoutIndex extends HomeState {}



class GetAllProductLoadingState extends HomeState {}
class GetAllProductSuccessState extends HomeState {}
class GetAllProductErrorState extends HomeState {}


class GetAllCategoriesLoadingState extends HomeState {}
class GetAllCategoriesSuccessState extends HomeState {}
class GetAllCategoriesErrorState extends HomeState {}


class GetAllCartProductLoadingState extends HomeState {}
class GetAllCartProductSuccessState extends HomeState {}
class GetAllCartProductErrorState extends HomeState {}



class AddToCartLoadingState extends HomeState {}
class AddToCartSuccessState extends HomeState {}
class AddToCartErrorState extends HomeState {}



class GetProductByIDLoadingState extends HomeState {}
class GetProductByIDSuccessState extends HomeState {}
class GetProductByIDErrorState extends HomeState {}


class GetCategoriesByIDLoadingState extends HomeState {}
class GetCategoriesByIDSuccessState extends HomeState {}
class GetCategoriesByIDErrorState extends HomeState {}



class ChangeFavoriteColor extends HomeState{}

class ChangeVisibility extends HomeState{}

class IncrementCounter extends HomeState{}
class DecrementCounter extends HomeState{}

class PriceChange extends HomeState{}