import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/layouts/account_layout.dart';
import 'package:nectaar/view/layouts/cart_layout.dart';
import 'package:nectaar/view/layouts/explore_layout.dart';
import 'package:nectaar/view/layouts/favorite_layout.dart';
import 'package:nectaar/view/layouts/shop_layout.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';
import 'package:nectaar/view_model/local/shared_preferences/shared_preferences.dart';
import 'package:nectaar/view_model/local/shared_preferences/shared_preferences_key.dart';
import 'package:nectaar/view_model/network/dio_helper/dio_helper.dart';
import 'package:nectaar/view_model/network/dio_helper/end_points.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  Product? currentProduct;
  Data? currentCategoryProducts;
  ProductModel? category;
  Data? cartProduct;

  ProductModel? productModel;

  bool isFavorite = false;
  bool isVisible = false;
  int counter = 1;
  num? price;
  List<Widget> layouts = [
    ShopLayout(),
    ExploreLayout(),
    CartLayout(),
    FavoriteLayout(),
    AccountLayout()
  ];
  int currentIndex = 0;

  void setCurrentIndex(index) {
    currentIndex = index;

    emit(ChangeLayoutIndex());
  }

  Future<void> getAllProduct() async {
    emit(GetAllProductLoadingState());
    DioHelper.get(endPoint: EndPoints.getAllProduct).then((value) {
      print("getAllProduct");
      productModel = ProductModel.fromJson(value.data);
      emit(GetAllProductSuccessState());
    }).catchError((onError) {
      emit(GetAllProductErrorState());
      print(onError);
      throw onError;
    });
  }

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    DioHelper.get(endPoint: EndPoints.getAllCategories).then((value) {
      print("getAllCategories");
      category = ProductModel.fromJson(value.data);
      emit(GetAllCategoriesSuccessState());
    }).catchError((onError) {
      emit(GetAllCategoriesErrorState());
      print(onError);
      throw onError;
    });
  }

  Future<void> getAllCartProduct() async {
    emit(GetAllCartProductLoadingState());
    DioHelper.get(
            endPoint: EndPoints.getAllCart,
            token: SharedPreference.get(SharedKeys.token))
        .then((value) {
      print("getAllCart");
      cartProduct = Data.fromJson(value.data);
      emit(GetAllCartProductSuccessState());
    }).catchError((onError) {
      emit(GetAllCartProductErrorState());
      print(onError);
      throw onError;
    });
  }

  Future<void> addToCart(int quantity) async {
    emit(AddToCartLoadingState());
    DioHelper.get(
            endPoint: EndPoints.addToCart,data: {"quantity" : quantity},
            token: SharedPreference.get(SharedKeys.token))
        .then((value) {
      getAllCartProduct();
      emit(AddToCartSuccessState());
    }).catchError((onError) {
      emit(AddToCartErrorState());
      print(onError);
      throw onError;
    });
  }

  Future<void> getProductById(int id) async {
    emit(GetProductByIDLoadingState());
    DioHelper.get(endPoint: "${EndPoints.getAllProduct}/$id").then((value) {
      currentProduct = Product.fromJson(value.data["data"]);
      emit(GetProductByIDSuccessState());
    }).catchError((onError) {
      emit(GetProductByIDErrorState());
      print(onError);
      throw onError;
    });
  }

  Future<void> getCategoriesProductsByID(int id) async {
    emit(GetCategoriesByIDLoadingState());
    DioHelper.get(
            endPoint:
                "${EndPoints.getAllCategories}/$id/${EndPoints.getAllProduct}")
        .then((value) {
      currentCategoryProducts = Data.fromJson(value.data["data"]);
      emit(GetCategoriesByIDSuccessState());
    }).catchError((onError) {
      emit(GetCategoriesByIDErrorState());
      print(onError);
      throw onError;
    });
  }

  void incrementCounter() {
    counter++;
    emit(IncrementCounter());
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
      emit(DecrementCounter());
    } else
      print("Minimum Quantity");
  }

  void changeFavorite() {
    isFavorite = !isFavorite;
    emit(ChangeFavoriteColor());
  }

  void changeVisibility() {
    isVisible = !isVisible;
    emit(ChangeVisibility());
  }

  num remainer(counter) {
    return price = ((counter * 4.99) * 100).round() / 100;
  }
}
