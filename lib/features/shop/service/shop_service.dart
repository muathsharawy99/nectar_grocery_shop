import 'package:nectaar/core/resources/api_constants.dart';
import 'package:nectaar/core/services/server_gate.dart';

class ShopService {
  Future<CustomResponse<Map<String, dynamic>>> getProducts() =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(
        url: ApiConstants.products,
      );

  Future<CustomResponse<Map<String, dynamic>>> getCategories() =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(
        url: ApiConstants.categories,
      );
}
