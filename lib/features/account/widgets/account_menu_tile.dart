import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

/// Account menu row: icon, title and a chevron.
class AccountMenuTile extends StatelessWidget {
  const AccountMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap ?? () {},
      leading: Icon(icon, color: context.defaultTextColor),
      title: Text(title, style: context.semiBold.copyWith(fontSize: FontSize.s16)),
      trailing: Icon(
        Icons.chevron_right_sharp,
        color: context.defaultTextColor,
        size: AppSize.s24.w,
      ),
    );
  }
}
