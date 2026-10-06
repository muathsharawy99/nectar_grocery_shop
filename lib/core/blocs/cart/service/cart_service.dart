import 'package:nectaar/core/resources/api_constants.dart';
import 'package:nectaar/core/services/server_gate.dart';

class CartService {
  Future<CustomResponse<Map<String, dynamic>>> getCart() =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(url: ApiConstants.cart);

  /// The store API takes the quantity as a query parameter.
  Future<CustomResponse<Map<String, dynamic>>> addToCart({
    required String id,
    required int quantity,
  }) => ServerGate.i.getFromServer<Map<String, dynamic>>(
    url: ApiConstants.addToCart.replaceAll('{id}', id),
    params: {'quantity': quantity},
  );
}
