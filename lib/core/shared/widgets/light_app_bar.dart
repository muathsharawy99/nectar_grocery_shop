import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/unified_extensions.dart';

/// White app bar (categories, product details): back, centered title and a
/// share icon.
class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LightAppBar({super.key, this.title = '', this.transparent = false});

  final String title;

  /// Over a header image (product details).
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparent
          ? Colors.transparent
          : context.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(title, style: context.bold.copyWith(fontSize: FontSize.s20)),
      leading: IconButton(
        onPressed: () => Navigator.maybePop(context),
        icon: Icon(Icons.arrow_back_ios_new, color: context.defaultTextColor),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.file_upload_outlined,
            color: context.defaultTextColor,
            size: AppSize.s24.w,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
