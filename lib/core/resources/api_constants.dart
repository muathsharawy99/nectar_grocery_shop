/// Endpoint paths, relative to [baseUrl].
class ApiConstants {
  /// Nectar has no Firebase project, so the base url is fixed here instead of
  /// being read from Firebase RTDB.
  static const String baseUrl = 'https://eraastore.eraasoft.com/api';

  // ── Auth
  static const String authLogin = 'auth/login';
  static const String authRegister = 'auth/register';

  // ── Products. `{id}` is replaced with the product id.
  static const String products = 'products';
  static const String productDetails = 'products/{id}';

  // ── Categories. `{id}` is replaced with the category id.
  static const String categories = 'categories';
  static const String categoryProducts = 'categories/{id}/products';

  // ── Cart. `{id}` is replaced with the product id.
  static const String cart = 'carts';
  static const String addToCart = 'addtocart/{id}';
}
