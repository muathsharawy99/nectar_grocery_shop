import 'package:nectaar/core/resources/api_constants.dart';
import 'package:nectaar/core/services/server_gate.dart';

class ProductDetailsService {
  Future<CustomResponse<Map<String, dynamic>>> getProduct(String id) =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(
        url: ApiConstants.productDetails.replaceAll('{id}', id),
      );
}
