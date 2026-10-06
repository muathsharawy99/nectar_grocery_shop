import 'package:dio/dio.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> body);

typedef ParamsMap = Map<String, dynamic>?;

typedef BodyMap = Map<String, dynamic>;
typedef BodyFormMap = Future<Map<String, dynamic>>;

typedef FormDataMap = FormData?;
