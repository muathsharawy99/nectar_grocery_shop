import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/core/resources/app_constants.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

String getFileType(String fileName) {
  if (fileName.isEmpty) return 'unknown';

  String extension = fileName.split('.').last.toLowerCase();

  switch (extension) {
    case 'jpg':
    case 'jpeg':
    case 'png':
    case 'gif':
    case 'bmp':
    case 'webp':
      return "image";
    case 'pdf':
    case 'doc':
    case 'docx':
    case 'xls':
    case 'xlsx':
    case 'ppt':
    case 'pptx':
      return "file";
    case 'mp4':
    case 'avi':
    case 'mov':
    case 'mkv':
      return "video";
    case 'mp3':
    case 'wav':
    case 'aac':
      return "audio";
    default:
      return "unknown";
  }
}

// ============================================================================
// STRING EXTENSION
// ============================================================================

extension StringExtension on String? {
  // ---------------------------------------------------------------------------
  // VALIDATION METHODS
  // ---------------------------------------------------------------------------

  /// Check email validation
  bool validateEmail() => hasMatch(this, Patterns.email);

  /// Check phone validation
  bool validatePhone() => hasMatch(this, Patterns.phone);

  /// Check saudi phone validation
  bool validateSaudiPhoneNumber() => hasMatch(this, Patterns.saudiPhoneNumber);

  /// Check password validation (returns true if valid)
  bool validatePassword() => hasMatch(this, Patterns.passwordPattern);

  /// Check password validation (returns true if valid)
  bool validatePasswordCharacterAtLeast() =>
      hasMatch(this, Patterns.passwordCharacterAtLeast);

  /// Check if string is an image file
  bool validateImage() => hasMatch(this, Patterns.image);

  /// Check if string contains only letters and Arabic characters
  bool validateName() => hasMatch(this, Patterns.name);

  /// Check URL validation
  bool validateURL() => hasMatch(this, Patterns.url);

  /// Check if string contains special characters
  bool validateSpecialCharacters() =>
      hasMatch(this, Patterns.specialCharacters);

  // ---------------------------------------------------------------------------
  // NULL/EMPTY CHECKS
  // ---------------------------------------------------------------------------

  /// Returns true if given string is null
  bool get isNull => this == null;

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull => this == null || this!.isEmpty || this! == 'null';

  /// Returns true if password is VALID (8-200 chars)
  bool get isValidPassword {
    if (this == null) return false;
    final length = this!.length;
    return length >= 8 && length <= 200;
  }

  // ---------------------------------------------------------------------------
  // UTILITY METHODS
  // ---------------------------------------------------------------------------

  /// Check null string, return given value if null
  String validate({String value = ''}) {
    return isEmptyOrNull ? value : this!;
  }

  /// Check if string contains only digits
  bool isDigit() {
    if (this == null || this!.isEmpty) return false;
    return RegExp(r'^\d+$').hasMatch(this!);
  }

  /// Return int value of given string
  int toInt({int defaultValue = 0}) {
    if (this == null) return defaultValue;
    return int.tryParse(this!) ?? defaultValue;
  }

  /// Return double value of given string
  double toDouble({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;
    return double.tryParse(this!) ?? defaultValue;
  }

  // ---------------------------------------------------------------------------
  // DATE/TIME CONVERSIONS
  // ---------------------------------------------------------------------------

  /// Convert string to DateTime
  DateTime toDate() {
    if (isEmptyOrNull) return DateTime.now();
    return DateTime.tryParse(this!) ?? DateTime.now();
  }

  /// Convert time string (HH:mm) to DateTime with today's date
  DateTime toTime() {
    if (isEmptyOrNull) return DateTime.now();

    try {
      final timeParts = this!.split(':');
      if (timeParts.length != 2) return DateTime.now();

      final hour = int.tryParse(timeParts[0]) ?? 0;
      final minute = int.tryParse(timeParts[1]) ?? 0;

      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, hour, minute);
    } catch (e) {
      log('Error parsing time: $e');
      return DateTime.now();
    }
  }

  /// Format time string to desired format
  String toFormattedTime({String format = 'HH:mm'}) {
    if (isEmptyOrNull) return '';

    try {
      final parsedTime = DateFormat('HH:mm').parse(this!, true).toUtc();
      final localTime = parsedTime.toLocal();
      return DateFormat(format).format(localTime);
    } catch (e) {
      if (kDebugMode) log('Error formatting time: $e');
      return '';
    }
  }

  /// Format date string to desired format
  String toFormattedDate({
    String format = 'dd/MM/yyyy',
    required BuildContext context,
  }) {
    if (isEmptyOrNull) return '';

    try {
      final date = DateTime.tryParse(this!) ?? DateTime.now();
      return DateFormat(format, context.locale.languageCode).format(date);
    } catch (e) {
      log('Error formatting date: $e');
      return '';
    }
  }

  // ---------------------------------------------------------------------------
  // FILE TYPE CHECKS
  // ---------------------------------------------------------------------------

  bool get isPdf => hasMatch(validate(), Patterns.pdf);
  bool get isImage => hasMatch(validate(), Patterns.image);
  bool get isUrl => hasMatch(validate(), Patterns.url);
}

// ============================================================================
// PATTERNS
// ============================================================================

class Patterns {
  Patterns._();

  static const String url =
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?)';

  static const String phone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static const String saudiPhoneNumber = r'^5[0-9]{8}$';

  // static const String passwordSpecialCharacter = r'[!@#$%&*]';
  static const String passwordCharacterAtLeast = r'[A-Za-z]';
  static const String passwordPattern = r'^(?=.*[A-Za-z]).{8,}$';
  static const String money = r'^\d{0,8}(\.\d{1,4})?$';

  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const String image = r'\.(jpeg|jpg|gif|png|bmp|webp)$';

  static const String name = r'^[a-zA-Z\u0600-\u06FF\s]*$';

  static const String specialCharacters = r'[!@#$%^&*(),.?":{}|<>]';

  static const String excel = r'\.(xls|xlsx)$';

  static const String pdf = r'\.pdf$';

  static const String price = r'(\d{1,3})(?=(\d{3})+(?!\d))';
}

// ============================================================================
// VALIDATOR
// ============================================================================
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

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_empty_field.tr();
    }
    if (value.length != AppConstants.otpLength) {
      return LocaleKeys.validations_wrong_otp.tr();
    }
    return null;
  }

  /// Local mobile number (without the country code): digits only.
  static String? validateMobile(String? value) {
    final v = (value ?? '').trim().replaceAll(' ', '');
    if (v.isEmpty) return LocaleKeys.validations_empty_field.tr();
    if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
      return LocaleKeys.validations_phone_digits_only.tr();
    }
    return null;
  }
}
// ============================================================================
// TIME CONVERSION EXTENSION
// ============================================================================

extension TimeConversion on String {
  DateTime getStartTime() {
    try {
      final timeParts = split(':');
      if (timeParts.length != 2) return DateTime.now();

      final hour = int.tryParse(timeParts[0]) ?? 0;
      final minute = int.tryParse(timeParts[1]) ?? 0;

      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, hour, minute);
    } catch (e) {
      log('Error parsing start time: $e');
      return DateTime.now();
    }
  }

  DateTime getEndTime(String startTime) {
    try {
      final startTimeLocal = startTime.getStartTime();
      final endParts = split(':');

      if (endParts.length != 2) return DateTime.now();

      final hour = int.tryParse(endParts[0]) ?? 0;
      final minute = int.tryParse(endParts[1]) ?? 0;

      final now = DateTime.now();
      DateTime endDate = DateTime(now.year, now.month, now.day, hour, minute);

      if (endDate.isBefore(startTimeLocal)) {
        endDate = endDate.add(const Duration(days: 1));
      }

      return endDate;
    } catch (e) {
      log('Error parsing end time: $e');
      return DateTime.now();
    }
  }
}

// ============================================================================
// COLOR EXTENSION
// ============================================================================

extension StringContext on String {
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

// String getDurationText(int months) {
//   if (months == 1) {
//     return LocaleKeys.auth_month.tr();
//   } else if (months == 3) {
//     return LocaleKeys.auth_3_months.tr();
//   } else if (months == 6) {
//     return LocaleKeys.auth_6_months.tr();
//   } else if (months == 12) {
//     return LocaleKeys.auth_year.tr();
//   } else {
//     return '$months ${LocaleKeys.auth_month.tr()}';
//   }
// }
