import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view_model/bloc/signup_cubit/signup_cubit.dart';
import 'package:nectaar/view_model/bloc/signup_cubit/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SignupCubit.get(context);
        return Scaffold(
          extendBodyBehindAppBar: true,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/carrot_colored.png",
                            width: 70.w,
                            height: 70.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                        width: double.infinity,
                      ),
                      Text(
                        "Enter your credentials to continue",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFormField(
                        controller: cubit.usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFormField(
                        controller: cubit.emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                            suffixIcon: Icon(
                              Icons.task_alt,
                            )),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFormField(
                        controller: cubit.passwordController,
                        obscureText: cubit.secure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.obsecurePassword();
                            },
                            icon: cubit.secure == true
                                ? Icon(
                                    Icons.visibility_off,
                                  )
                                : Icon(
                                    Icons.visibility,
                                  ),
                          ),
                          labelText: "Password",
                          labelStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Wrap(
                        // alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          RichText(
                            textScaleFactor: 1,
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: !true),
                            text: TextSpan(
                              text: "By continuing you agree to our ",
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: Colors.black,
                                height: 1.5,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size(10.w, 10.h),
                              maximumSize: Size(double.infinity, 10.h),
                            ),
                            child: Text(
                              "Terms of Service",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp, height: 1),
                            ),
                          ),
                          RichText(
                            textScaleFactor: 1,
                            text: TextSpan(
                              text: " and",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12.sp,
                                height: 1.5,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size(10.w, 14.h),
                              maximumSize: Size(double.infinity, 14.h),
                            ),
                            child: Text(
                              "Privacy Policy.",
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                cubit.register();
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.poppins(),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigation.pushAndReplacement(
                              //   context,
                              //   LoginScreen(),
                              // );
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                color: ColorAssets.green,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
