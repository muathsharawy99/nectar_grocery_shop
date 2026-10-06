class JsonParser {
  JsonParser._();

  /// Parse to String safely
  static String parseString(dynamic value) {
    if (value == null) return '';
    if (value is String) return value;
    return value.toString();
  }

  /// Parse to int safely
  static int parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    if (value is double) return value.toInt();
    return 0;
  }

  /// Parse to double safely
  static double parseDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? defaultValue;
    if (value is num) return value.toDouble();
    return defaultValue;
  }

  /// Parse to bool safely
  static bool parseBool(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      final lowered = value.toLowerCase();
      if (lowered == 'true' || lowered == '1') return true;
      if (lowered == 'false' || lowered == '0') return false;
    }
    return defaultValue;
  }

  static List<T> parseList<T>(
    dynamic value, {
    List<T> defaultValue = const [],
    T Function(dynamic item)? itemParser,
  }) {
    if (value == null) return defaultValue;
    if (value is List<T>) return value;
    if (value is List) {
      if (itemParser != null) {
        return value.map((e) => itemParser(e)).toList();
      } else {
        return value.cast<T>();
      }
    }
    return defaultValue;
  }

  /// Parse to nullable String
  static String? parseNullableString(dynamic value) {
    if (value == null || value == 'null' || value == '') return null;
    if (value is String) return value;
    return value.toString();
  }

  /// Parse to nullable int
  static int? parseNullableInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    if (value is num) return value.toInt();
    return null;
  }

  /// Parse to nullable double
  static double? parseNullableDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    if (value is num) return value.toDouble();
    return null;
  }

  /// Parse to nullable bool
  static bool? parseNullableBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      final lowered = value.toLowerCase();
      if (lowered == 'true' || lowered == '1') return true;
      if (lowered == 'false' || lowered == '0') return false;
    }
    return null;
  }

  /// Parse to List< String>
  static List<String> parseStringList(
    dynamic value, {
    List<String> defaultValue = const [],
  }) {
    if (value == null) return defaultValue;
    if (value is List<String>) return value;
    if (value is List) return value.map((e) => e.toString()).toList();
    return defaultValue;
  }

  /// Parse to List< int>
  static List<int> parseIntList(
    dynamic value, {
    List<int> defaultValue = const [],
  }) {
    if (value == null) return defaultValue;
    if (value is List<int>) return value;
    if (value is List) {
      return value.map((e) {
        if (e is int) return e;
        if (e is num) return e.toInt();
        if (e is String) return int.tryParse(e) ?? 0;
        return 0;
      }).toList();
    }
    return defaultValue;
  }

  /// Parse to DateTime safely
  static DateTime parseDateTime(dynamic value, {DateTime? defaultValue}) {
    final fallback = defaultValue ?? DateTime.now();
    if (value == null) return fallback;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? fallback;
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    return fallback;
  }

  /// Parse to nullable DateTime
  static DateTime? parseNullableDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    return null;
  }

  /// Parse nested Map safely
  static Map<String, dynamic> parseMap(
    dynamic value, {
    Map<String, dynamic> defaultValue = const {},
  }) {
    if (value == null) return defaultValue;
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }
    return defaultValue;
  }

  /// Parse nullable nested Map
  static Map<String, dynamic>? parseNullableMap(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }
    return null;
  }

  /// Parse to List< Map< String, dynamic>>
  static List<Map<String, dynamic>> parseMapList(
    dynamic value, {
    List<Map<String, dynamic>> defaultValue = const [],
  }) {
    if (value == null) return defaultValue;
    if (value is List<Map<String, dynamic>>) return value;
    if (value is List) {
      return value.map((e) {
        if (e is Map<String, dynamic>) return e;
        if (e is Map) {
          return e.map((key, value) => MapEntry(key.toString(), value));
        }
        return <String, dynamic>{};
      }).toList();
    }
    return defaultValue;
  }

  /// Parse enum from string
  static T? parseEnum<T>(dynamic value, List<T> values) {
    if (value == null) return null;
    final stringValue = value.toString().toLowerCase();
    try {
      return values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == stringValue,
      );
    } catch (_) {
      return null;
    }
  }

  /// Parse enum from string with default
  static T parseEnumWithDefault<T>(
    dynamic value,
    List<T> values,
    T defaultValue,
  ) {
    return parseEnum(value, values) ?? defaultValue;
  }
}
