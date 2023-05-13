import 'package:dio/dio.dart';
import 'package:nectaar/view_model/network/dio_helper/end_points.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  }

  static Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      var response = await dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
  static Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
}
