/// Endpoint paths, relative to [baseUrl].
///
/// An empty path means the backend hasn't shipped that endpoint yet: its
/// service answers with `UiOnlyResponse` so the screens work UI-only. Fill
/// the path when the API is ready and the real request goes out.
class ApiConstants {
  /// Nectar has no Firebase project, so the base url is fixed here instead of
  /// being read from Firebase RTDB.
  static const String baseUrl = 'https://eraastore.eraasoft.com/api';

  // ── Auth
  static const String authLogin = 'auth/login';
  static const String authRegister = 'auth/register';
  static const String authLogout = 'auth/logout';

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
