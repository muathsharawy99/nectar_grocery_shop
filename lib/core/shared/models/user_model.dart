import 'dart:convert';

import '../../services/shared_preference.dart';
import 'base.dart';

/// The signed-in user, kept in memory as `UserModel.i` and persisted with
/// [CacheHelper] (`AppCached.user`).
class UserModel extends Model {
  UserModel._();

  static UserModel i = UserModel._();

  late String name, email, token;

  bool get isAuth => token.isNotEmpty;

  void fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'name');
    email = stringFromJson(json, 'email');
    token = stringFromJson(json, 'token');
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'token': token,
  };

  Future<void> save() async {
    await CacheHelper.setValue(AppCached.user, jsonEncode(toJson()));
  }

  Future<void> clear() async {
    await CacheHelper.clear();
    fromJson();
  }

  void get() {
    final String user = CacheHelper.getValue(AppCached.user) ?? '{}';
    final Map<String, dynamic> json = jsonDecode(user);
    fromJson(json);
    // Sessions saved by the old app kept only the token.
    final legacyToken = CacheHelper.getValue(AppCached.token);
    if (token.isEmpty && legacyToken is String) token = legacyToken;
  }

  @override
  String toString() => 'UserModel{id: $id, name: $name, email: $email}';
}
