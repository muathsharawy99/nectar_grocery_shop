import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Double Extensions
extension DoubleExtensions on double? {
  /// Validate given double is not null and returns given value if null.
  double validate({double value = 0.0}) => this ?? value;

  /// 100.0.isBetween(50.0, 150.0) // true;
  bool isBetween(num first, num second) {
    final lower = min(first, second);
    final upper = max(first, second);
    // ignore: unnecessary_this
    return this.validate() >= lower && this.validate() <= upper;
  }

  /// Returns Size
  Size get size => Size(this!, this!);

  /// Leaves given height of space
  Widget get height => this!.verticalSpace;

  /// Leaves given width of space
  Widget get width => this!.horizontalSpace;

  /// Converts the value of this [double] to radians.
  ///
  /// Returns the value of this [double] in radians by multiplying it with the conversion factor `pi / 180.0`.
  double get toRadians => validate() * (pi / 180.0);

  EdgeInsets get edgeInsetsHorizontal =>
      EdgeInsets.symmetric(horizontal: validate());

  EdgeInsets get edgeInsetsVertical =>
      EdgeInsets.symmetric(vertical: validate());

  EdgeInsets get edgeInsetsAll => EdgeInsets.all(validate());

  EdgeInsets get edgeInsetsOnlyTop => EdgeInsets.only(top: validate());

  EdgeInsets get edgeInsetsOnlyBottom => EdgeInsets.only(bottom: validate());

  EdgeInsets get edgeInsetsOnlyLeft => EdgeInsets.only(left: validate());

  EdgeInsets get edgeInsetsOnlyRight => EdgeInsets.only(right: validate());

  BorderRadius get borderRadius => BorderRadius.circular(validate());

  BorderRadius get leftBorderRadius => BorderRadius.only(
    topLeft: Radius.circular(validate()),
    bottomLeft: Radius.circular(validate()),
  );

  BorderRadius get rightBorderRadius => BorderRadius.only(
    topRight: Radius.circular(validate()),
    bottomRight: Radius.circular(validate()),
  );

  BorderRadius get topBorderRadius => BorderRadius.only(
    topLeft: Radius.circular(validate()),
    topRight: Radius.circular(validate()),
  );

  BorderRadius get bottomBorderRadius => BorderRadius.only(
    bottomLeft: Radius.circular(validate()),
    bottomRight: Radius.circular(validate()),
  );
}

extension MoneyExtension on num {
  /// 1290 → "1,290.00"
  String get toMoney {
    final parts = toStringAsFixed(2).split('.');
    final whole = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
      (m) => '${m[1]},',
    );
    return '$whole.${parts[1]}';
  }

  /// Like [toMoney] without the decimals when they are zero: 1290 → "1,290".
  String get toMoneyShort {
    final money = toMoney;
    return money.endsWith('.00') ? money.substring(0, money.length - 3) : money;
  }
}
