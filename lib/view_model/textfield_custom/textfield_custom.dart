import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldCustom {
  static void textField({double borderRadius = 0, String? label,}) {
    TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r)
        ),
        labelText: label,
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(strokeAlign: BorderSide.strokeAlignOutside,color: Colors.blue),
            borderRadius: BorderRadius.circular(borderRadius.r,)
        ),

      ),
    );
  }
}
