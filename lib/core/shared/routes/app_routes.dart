import 'package:flutter/material.dart';

import '../../../features/auth/screens/login/screens/login_screen.dart';
import '../../../features/auth/screens/register/screens/register_screen.dart';
import '../../../features/categories/screens/list/screens/categories_screen.dart';
import '../../../features/categories/screens/products/screens/category_products_screen.dart';
import '../../../features/intro/onboarding/screens/onboarding_screen.dart';
import '../../../features/intro/splash/screens/splash_screen.dart';
import '../../../features/layout/screens/layout_screen.dart';
import '../../../features/product_details/screens/product_details_screen.dart';
import '../../extensions/context_extensions.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();

  String initial = NamedRoutes.splash;

  AppRoutes._internal();

  Map<String, Widget Function(BuildContext c)> appRoutes = {
    // Intro
    NamedRoutes.splash: (c) => const SplashScreen(),
    NamedRoutes.onboarding: (c) => const OnboardingScreen(),

    // Auth
    NamedRoutes.login: (c) => const LoginScreen(),
    NamedRoutes.register: (c) => const RegisterScreen(),

    // App
    NamedRoutes.home: (c) => const LayoutScreen(),

    // Catalog
    NamedRoutes.categories: (c) => const CategoriesScreen(),
    NamedRoutes.categoryProducts: (c) => CategoryProductsScreen(
      id: '${c.arg[RouteString.id] ?? ''}',
      name: '${c.arg[RouteString.name] ?? ''}',
    ),
    NamedRoutes.productDetails: (c) =>
        ProductDetailsScreen(id: '${c.arg[RouteString.id] ?? ''}'),
  };
}

class RouteString {
  static const id = "id";
  static const name = "name";
}
