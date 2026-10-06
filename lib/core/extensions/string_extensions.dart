import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

extension StringExtension on String? {
  /// Check email validation
  bool validateEmail() => hasMatch(this, Patterns.email);
}

class Patterns {
  Patterns._();

  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}

class Validator {
  Validator._();

  static String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.validations_empty_field.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.validations_empty_field.tr();
    }
    if (!value.trim().validateEmail()) {
      return LocaleKeys.validations_email_invalid.tr();
    }
    return null;
  }
}

extension StringContext on String {
  /// `#53B175` / `53B175` → [Color] (used by `Model.colorFromJson`).
  Color get color {
    try {
      String colorStr = replaceAll("#", "");
      if (colorStr.length == 6) {
        colorStr = "FF$colorStr";
      }
      return Color(int.parse(colorStr, radix: 16));
    } catch (e) {
      log('Error parsing color: $e');
      return Colors.transparent;
    }
  }
}
