import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';

export '../../resources/dimensions_manager.dart';

class TextStylesManager {
  static const TextStyle regularText = TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle mediumText = TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle semiBoldText = TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle boldText = TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: 0,
  );
}
