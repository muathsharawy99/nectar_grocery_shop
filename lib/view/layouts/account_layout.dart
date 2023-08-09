import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/screens/auth/login_screen.dart';
import 'package:nectaar/view_model/bloc/login_cubit/login_cubit.dart';
import 'package:nectaar/view_model/bloc/login_cubit/login_state.dart';
import 'package:nectaar/view_model/local/shared_preferences/shared_preferences.dart';
import 'package:nectaar/view_model/navigation/navigation.dart';

class AccountLayout extends StatelessWidget {
  const AccountLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.asset("assets/m.jpg").image,
                      radius: 40.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${cubit.userModel?.data?.name}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mode_edit_outlined,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "${cubit.userModel?.data?.email}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                  title: const Text("Orders"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.credit_card_sharp,
                    color: Colors.black,
                  ),
                  title: const Text("My Details"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  title: const Text("Delivery Address"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.credit_card_sharp,
                    color: Colors.black,
                  ),
                  title: const Text("Payment Methods"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.airplane_ticket_rounded,
                    color: Colors.black,
                  ),
                  title: const Text("Promo Code"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  title: const Text("Notifications"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  title: const Text("Help"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                ListTile(
                  onTap: () {},
                  leading: const RotatedBox(
                    quarterTurns: 190,
                    child: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text("About"),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 5.h,
                  thickness: 2,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: 300.w,
                  height: 50.h,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorAssets.silver),
                    onPressed: () {
                      SharedPreference.clear();
                      Navigation.pushAndReplacement(context, const LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.logout,
                          color: ColorAssets.green,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(color: ColorAssets.green),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
