import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/screens/auth/login_screen.dart';
import 'package:nectaar/view_model/navigation/navigation.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            "assets/man.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          PositionedDirectional(
            bottom: 30.h,
            start: 30.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/carrot.png",
                    width: 50.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Welcome\nto our store",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Get your groceries in as fast as one hour",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
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
                        backgroundColor: ColorAssets.green,
                      ),
                      onPressed: () {
                        Navigation.pushAndReplacement(
                          context,
                          const LoginScreen(),
                        );
                      },
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
