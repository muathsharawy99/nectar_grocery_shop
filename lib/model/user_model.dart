class UserModel {
  Data? data;
  String? token;
  String? message;
  int? code;
  String? errors;

  UserModel({this.data, this.token, this.message, this.code, this.errors});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
    code = json['code'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    data['message'] = message;
    data['code'] = code;
    data['errors'] = errors;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.email, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
