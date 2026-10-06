import 'package:get_it/get_it.dart';

import '../../features/auth/screens/login/manager/login_cubit.dart';
import '../../features/auth/screens/login/service/login_service.dart';
import '../../features/auth/screens/register/manager/register_cubit.dart';
import '../../features/auth/screens/register/service/register_service.dart';
import '../../features/categories/screens/list/manager/categories_cubit.dart';
import '../../features/categories/screens/products/manager/category_products_cubit.dart';
import '../../features/categories/service/categories_service.dart';
import '../../features/explore/manager/explore_cubit.dart';
import '../../features/explore/service/explore_service.dart';
import '../../features/layout/manager/layout_cubit.dart';
import '../../features/product_details/manager/product_details_cubit.dart';
import '../../features/product_details/service/product_details_service.dart';
import '../../features/shop/manager/shop_cubit.dart';
import '../../features/shop/service/shop_service.dart';
import '../blocs/cart/manager/cart_cubit.dart';
import '../blocs/cart/service/cart_service.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //app-wide
    sl.registerLazySingleton(() => CartCubit(CartService()));

    //auth
    sl.registerFactory(() => LoginCubit(LoginService()));
    sl.registerFactory(() => RegisterCubit(RegisterService()));

    //layout
    sl.registerFactory(() => LayoutCubit());

    //shop
    sl.registerFactory(() => ShopCubit(ShopService()));

    //explore
    sl.registerFactory(() => ExploreCubit(ExploreService()));

    //categories
    sl.registerFactory(() => CategoriesCubit(CategoriesService()));
    sl.registerFactory(() => CategoryProductsCubit(CategoriesService()));

    //product details
    sl.registerFactory(() => ProductDetailsCubit(ProductDetailsService()));
  }
}
