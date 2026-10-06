// ignore_for_file: must_be_immutable
import 'base.dart';

/// A product from the store API (also the shape of the cart lines).
class ProductModel extends Model {
  late String name, description;
  late int quantity;
  late double price;

  ProductModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'name');
    description = stringFromJson(json, 'description');
    quantity = intFromJson(json, 'quantity');
    price = doubleFromJson(json, 'price');
  }

  /// `4` instead of `4.0`, `4.99` stays `4.99`.
  String get priceText => price == price.truncateToDouble()
      ? price.toInt().toString()
      : price.toStringAsFixed(2);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'quantity': quantity,
    'price': price,
  };

  /// Products from a list response: `{data: [...]}` or the paginated
  /// `{data: {data: [...]}}` of the store API.
  static List<ProductModel> listFrom(dynamic body) {
    dynamic raw = body is Map ? body['data'] : null;
    if (raw is Map) raw = raw['data'];
    return [
      if (raw is List)
        for (final e in raw)
          if (e is Map) ProductModel.fromJson(Map<String, dynamic>.from(e)),
    ];
  }
}
