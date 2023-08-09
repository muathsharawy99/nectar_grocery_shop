import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/screens/auth/verification_screen.dart';
import 'package:nectaar/view_model/navigation/navigation.dart';

class NumberScreen extends StatelessWidget {
  NumberScreen({Key? key}) : super(key: key);
  String? countrycode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/top_color.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Text(
                    "Enter your mobile number",
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    "Mobile Number",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  IntlPhoneField(
                    keyboardType: TextInputType.number,
                    onSubmitted: (v) {
                      if (v != "0123456789") {
                        Fluttertoast.showToast(
                          msg: "Enter from 0 to 9",
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      } else {
                        return;
                      }
                    },
                    initialCountryCode: "EG",
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 67.w,
        height: 67.h,
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {
            Navigation.push(
              context,
              const VerificationScreen(),
            );
          },
          backgroundColor: ColorAssets.green,
          child: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ),
    );
  }
}
