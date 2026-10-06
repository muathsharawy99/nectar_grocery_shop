import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// `−  [ 1 ]  +` quantity picker (product details, cart lines).
class QuantityCounter extends StatelessWidget {
  const QuantityCounter({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement, onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onDecrement,
          icon: Icon(Icons.remove, color: context.mutedTextColor),
        ),
        Container(
          width: AppSize.s45.w,
          height: AppSize.s45.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: context.borderColor,
            ),
            borderRadius: BorderRadius.circular(AppSize.borderRadius.r),
          ),
          child: Text(
            '$quantity',
            style: context.semiBold.copyWith(fontSize: FontSize.s18),
          ),
        ),
        IconButton(
          onPressed: onIncrement,
          icon: Icon(Icons.add, color: context.primaryColor),
        ),
      ],
    );
  }
}
