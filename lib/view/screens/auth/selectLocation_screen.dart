import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/screens/auth/login_screen.dart';
import 'package:nectaar/view_model/navigation/navigation.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(
          children: [
            Image.asset(
              "assets/top_color.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Image.asset("assets/location.png"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Select Your Location",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    width: double.infinity,
                  ),
                  Text(
                    "Switch on your location to stay in tune with what’s happening in your area",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      labelText: "Your Zone",
                      labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Container(
                    width: 315.w,
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
                          LoginScreen(),
                        );
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
