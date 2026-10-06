import 'server_gate.dart';

/// Stand-in answer for endpoints whose path is still empty in `ApiConstants`
/// (backend not ready yet), so every screen works UI-only.
///
/// Services guard their request like this:
/// ```dart
/// if (ApiConstants.authLogin.isEmpty) {
///   return UiOnlyResponse.success<Map<String, dynamic>>();
/// }
/// return ServerGate.i.sendToServer(url: ApiConstants.authLogin, ...);
/// ```
/// When the API is ready, fill the path in `ApiConstants` and the guard stops
/// firing on its own; delete the guard (and its sample data) when cleaning up.
class UiOnlyResponse {
  const UiOnlyResponse._();

  static Future<CustomResponse<T>> success<T>({
    T? data,
    String msg = '',
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return CustomResponse<T>(
      success: true,
      statusCode: 200,
      msg: msg,
      data: data,
    );
  }
}
