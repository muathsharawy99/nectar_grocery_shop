import 'package:nectaar/core/resources/api_constants.dart';
import 'package:nectaar/core/services/server_gate.dart';

class CategoriesService {
  Future<CustomResponse<Map<String, dynamic>>> getCategories() =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(
        url: ApiConstants.categories,
      );

  Future<CustomResponse<Map<String, dynamic>>> getCategoryProducts(
    String id,
  ) => ServerGate.i.getFromServer<Map<String, dynamic>>(
    url: ApiConstants.categoryProducts.replaceAll('{id}', id),
  );
}
