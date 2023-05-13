import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/view/color/color_assets.dart';

class AccountLayout extends StatelessWidget {
  const AccountLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          "Muath Sharawy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mode_edit_outlined,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "muath0sharawy@gmail.com",
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
              leading: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              title: Text("Orders"),
              trailing: Icon(
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
              leading: Icon(
                Icons.credit_card_sharp,
                color: Colors.black,
              ),
              title: Text("My Details"),
              trailing: Icon(
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
              leading: Icon(
                Icons.location_on_outlined,
                color: Colors.black,
              ),
              title: Text("Delivery Address"),
              trailing: Icon(
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
              leading: Icon(
                Icons.credit_card_sharp,
                color: Colors.black,
              ),
              title: Text("Payment Methods"),
              trailing: Icon(
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
              leading: Icon(
                Icons.airplane_ticket_rounded,
                color: Colors.black,
              ),
              title: Text("Promo Code"),
              trailing: Icon(
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
              leading: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              title: Text("Notifications"),
              trailing: Icon(
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
              leading: Icon(
                Icons.help,
                color: Colors.black,
              ),
              title: Text("Help"),
              trailing: Icon(
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
              leading: RotatedBox(
                quarterTurns: 190,
                child: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
              ),
              title: Text("About"),
              trailing: Icon(
                Icons.chevron_right_sharp,
                color: Colors.black,
              ),
            ),
            Divider(
              height: 5.h,
              thickness: 2,
            ),
            SizedBox(height: 25.h,),
            Container(
              width: 300.w,
              height: 50.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: ColorAssets.silver),
                onPressed: () {},
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.logout,color: ColorAssets.green,),
                    Text("Log Out",style: TextStyle(color: ColorAssets.green),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
