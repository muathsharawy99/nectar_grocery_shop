// ignore_for_file: must_be_immutable
import 'base.dart';

/// A product category from the store API.
class CategoryModel extends Model {
  late String name;

  CategoryModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'name');
  }

  @override
  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  /// Categories from a list response: `{data: [...]}` or the paginated
  /// `{data: {data: [...]}}` of the store API.
  static List<CategoryModel> listFrom(dynamic body) {
    dynamic raw = body is Map ? body['data'] : null;
    if (raw is Map) raw = raw['data'];
    return [
      if (raw is List)
        for (final e in raw)
          if (e is Map) CategoryModel.fromJson(Map<String, dynamic>.from(e)),
    ];
  }
}
