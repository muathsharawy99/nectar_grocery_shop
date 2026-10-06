// ignore_for_file: must_be_immutable
import 'base.dart';

/// A simple `{id, name}` option from the API (categories, payment methods,
/// units…) — use it for pickers instead of a one-off model.
class IdNameModel extends Model {
  late String name;

  IdNameModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'name');
  }

  @override
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
