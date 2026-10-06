import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../extensions/unified_extensions.dart';
import '../utils/logger.dart';

class ServerGate {
  static bool logEnabled = kDebugMode;
  static bool logFullAuthToken = false;

  Future<Map<String, dynamic>> get constHeader async => {
    if (UserModel.i.isAuth) "Authorization": "Bearer ${UserModel.i.token}",
    "Accept": "application/json",
    "Accept-Language": LocaleKeys.lang.tr(),
  }..removeWhere((key, value) => value == null || '$value'.trim().isEmpty);

  final Dio _dio = Dio();

  ServerGate._() {
    _dio.interceptors.add(CustomApiInterceptor());
    _dio.options = _dio.options.copyWith(
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    );
  }

  static final ServerGate i = ServerGate._();

  static void _clean(Map<String, dynamic>? map) {
    map?.removeWhere((key, value) => value == null || '$value'.trim().isEmpty);
  }

  Future<String> _resolveUrl(String url) async =>
      url.startsWith('http') ? url : '${ApiConstants.baseUrl}/$url';

  /// [keepNullsInBody] sends `body` as-is (no null/empty stripping) - for
  /// endpoints where an explicit `null` is meaningful.
  Future<CustomResponse<T>> sendToServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
    bool keepNullsInBody = false,
  }) async {
    try {
      _clean(params);
      _clean(headers);
      if (!keepNullsInBody) _clean(body);
      _clean(formData);
      final res = await _dio.post(
        await _resolveUrl(url),
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {...(await constHeader), if (headers != null) ...headers},
        ),
        queryParameters: params,
      );
      return _asSuccessResponse(res);
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.something_went_wrong_please_try_again.tr(),
      );
    }
  }

  Future<CustomResponse<T>> deleteFromServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
  }) async {
    try {
      _clean(params);
      _clean(headers);
      _clean(body);
      _clean(formData);
      final res = await _dio.delete(
        await _resolveUrl(url),
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {...(await constHeader), if (headers != null) ...headers},
        ),
        queryParameters: params,
      );
      return _asSuccessResponse(res);
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.something_went_wrong_please_try_again.tr(),
      );
    }
  }

  Future<CustomResponse<T>> getFromServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    try {
      _clean(params);
      _clean(headers);
      final res = await _dio.get(
        await _resolveUrl(url),
        cancelToken: cancelToken,
        options: Options(
          headers: {...(await constHeader), if (headers != null) ...headers},
        ),
        queryParameters: params,
      );
      return _asSuccessResponse(res);
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 402,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.something_went_wrong_please_try_again.tr(),
      );
    }
  }

  Future<CustomResponse<T>> putToServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
  }) async {
    try {
      _clean(params);
      _clean(headers);
      _clean(body);
      _clean(formData);
      final res = await _dio.put(
        await _resolveUrl(url),
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {...(await constHeader), if (headers != null) ...headers},
        ),
        queryParameters: params,
      );
      return _asSuccessResponse(res);
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.something_went_wrong_please_try_again.tr(),
      );
    }
  }

  Future<CustomResponse<T>> patchToServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
  }) async {
    try {
      _clean(params);
      _clean(headers);
      _clean(body);
      _clean(formData);
      final res = await _dio.patch(
        await _resolveUrl(url),
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {...(await constHeader), if (headers != null) ...headers},
        ),
        queryParameters: params,
      );
      return _asSuccessResponse(res);
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.something_went_wrong_please_try_again.tr(),
      );
    }
  }

  CustomResponse<T> _asSuccessResponse<T>(Response<dynamic> res) {
    final statusCode = res.statusCode ?? 422;
    if (statusCode >= 300 || res.data is! Map) {
      throw DioException.badResponse(
        statusCode: statusCode,
        requestOptions: res.requestOptions,
        response: res,
      );
    }
    return CustomResponse<T>(
      success: true,
      statusCode: statusCode,
      errType: ErrorType.none,
      data: res.data,
      msg: res.data?['message']?.toString() ?? '',
    );
  }

  Future<CustomResponse<T>> handleServerError<T>(DioException err) async {
    if (err.type == DioExceptionType.cancel) {
      return CustomResponse(
        success: false,
        statusCode: err.response?.statusCode ?? 0,
        errType: ErrorType.canceled,
        msg: _safeMessage(err.response?.data),
        data: _toMap(err.response?.data) as T?,
      );
    }

    if (err.type == DioExceptionType.badResponse) {
      final data = err.response?.data;
      final text = '$data';
      if (text.contains('DOCTYPE') ||
          text.contains('<script>') ||
          (data is Map && data['exception'] != null)) {
        return CustomResponse(
          success: false,
          errType: ErrorType.server,
          statusCode: err.response?.statusCode ?? 500,
          msg: kDebugMode
              ? text
              : LocaleKeys.something_went_wrong_please_try_again.tr(),
        );
      }

      if (err.response?.statusCode == 401) {
        await UserModel.i.clear();
        pushAndRemoveUntil(AppRoutes.init.initial);
        return CustomResponse(
          success: false,
          statusCode: 401,
          errType: ErrorType.unAuth,
          msg: _safeMessage(err.response?.data),
          data: _toMap(err.response?.data) as T?,
        );
      }

      return CustomResponse(
        success: false,
        statusCode: err.response?.statusCode ?? 500,
        errType: ErrorType.backEndValidation,
        msg: _safeMessage(
          err.response?.data,
          fallback: LocaleKeys.something_went_wrong_please_try_again.tr(),
        ),
        data: _toMap(err.response?.data) as T?,
      );
    }

    if (err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return CustomResponse(
        success: false,
        statusCode: err.response?.statusCode ?? 500,
        errType: ErrorType.network,
        msg: LocaleKeys.poor_connection_check_the_quality_of_the_internet.tr(),
        data: _toMap(err.response?.data) as T?,
      );
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.connectionError ||
        err.response == null) {
      return CustomResponse(
        success: false,
        statusCode: 402,
        errType: ErrorType.network,
        msg: LocaleKeys.please_check_your_internet_connection.tr(),
        data: _toMap(err.response?.data) as T?,
      );
    }

    return CustomResponse(
      success: false,
      statusCode: 402,
      errType: ErrorType.unknown,
      msg: LocaleKeys.something_went_wrong_please_try_again.tr(),
      data: _toMap(err.response?.data) as T?,
    );
  }

  static Map<String, dynamic>? _toMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    return null;
  }

  static String _safeMessage(dynamic value, {String fallback = ''}) {
    if (value is Map) {
      final errorsMessage = _extractFirstErrorMessage(value['errors']);
      if (errorsMessage.isNotEmpty) return errorsMessage;
      final message = value['message']?.toString() ?? '';
      if (message.trim().isNotEmpty) return message;
    }
    return fallback;
  }

  static String _extractFirstErrorMessage(dynamic errors) {
    if (errors == null) return '';
    if (errors is List) {
      if (errors.isEmpty) return '';
      return _extractFirstErrorMessage(errors.first);
    }
    if (errors is Map) {
      if (errors.isEmpty) return '';
      for (final entry in errors.entries) {
        final message = _extractFirstErrorMessage(entry.value);
        if (message.trim().isNotEmpty) return message;
      }
      return '';
    }
    return errors.toString();
  }
}

class CustomApiInterceptor extends Interceptor {
  final _log = LoggerDebug(
    headColor: LogColors.red,
    constTitle: 'Server Gate Logger',
    enabled: ServerGate.logEnabled,
  );

  CustomApiInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log.red(
      '------ Current Error Response (status code ${err.response?.statusCode}) -----',
    );
    _log.red(jsonEncode(err.response?.data));
    _log.white(_generateCurlCommand(err.requestOptions));
    super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _log.green(
      '------ Current Response (status code ${response.statusCode}) ------',
    );
    _log.green(jsonEncode(response.data));
    _log.white(_generateCurlCommand(response.requestOptions));
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log.yellow('------ Current Request Path -----');
    _log.yellow(
      '${options.path} ${LogColors.red}API METHOD : (${options.method})${LogColors.reset}',
    );
    if (options.data != null) {
      _log.blue('------ Current Request Body Data -----');
      if (options.data is FormData) {
        final body = <String, dynamic>{
          for (final e in (options.data as FormData).fields) e.key: e.value,
        };
        _log.blue(jsonEncode(body));
      } else {
        _log.blue(jsonEncode(options.data));
      }
    }
    _log.blue('------ Current Request Parameters Data -----');
    _log.blue(jsonEncode(options.queryParameters));
    _log.yellow('------ Current Request Headers -----');
    _log.yellow(jsonEncode(options.headers));
    super.onRequest(options, handler);
  }

  String _generateCurlCommand(RequestOptions options) {
    final curlCommand = StringBuffer(
      "curl -X ${options.method} '${options.uri}'",
    );

    options.headers.forEach((key, value) {
      curlCommand.write(" -H '$key: $value'");
    });

    final data = options.data;
    if (data != null) {
      if (data is FormData) {
        final map = {
          for (final e in data.fields) e.key: e.value,
          for (final f in data.files) f.key: f.value.filename,
        };
        curlCommand.write(" --data '${jsonEncode(map)}'");
      } else if (data is Map) {
        curlCommand.write(" --data '${jsonEncode(data)}'");
      } else {
        curlCommand.write(" --data '$data'");
      }
    }

    return curlCommand.toString();
  }
}

class CustomResponse<T> {
  bool success;
  ErrorType errType;
  String msg;
  int statusCode;
  T? data;

  CustomResponse({
    this.success = false,
    this.errType = ErrorType.none,
    this.msg = "",
    this.statusCode = 0,
    this.data,
  });
}
