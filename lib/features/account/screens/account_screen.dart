import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/blocs/cart/manager/cart_cubit.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';

import '../widgets/account_header.dart';
import '../widgets/account_menu.dart';
import '../widgets/logout_button.dart';

/// Account tab: the signed-in user, the menu and "Log Out".
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  Future<void> _logout() async {
    await UserModel.i.clear();
    sl<CartCubit>().reset();
    pushAndRemoveUntil(NamedRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppSize.screenPadding.w),
      children: [
        AccountHeader(name: UserModel.i.name, email: UserModel.i.email),
        SizedBox(height: AppSize.s10.h),
        const AccountMenu(),
        SizedBox(height: AppSize.s25.h),
        LogoutButton(onTap: _logout),
      ],
    );
  }
}
