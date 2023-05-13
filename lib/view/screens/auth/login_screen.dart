import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/screens/home_screen.dart';
import 'package:nectaar/view/screens/auth/signup_screen.dart';
import 'package:nectaar/view_model/bloc/login_cubit/login_cubit.dart';
import 'package:nectaar/view_model/bloc/login_cubit/login_state.dart';
import 'package:nectaar/view_model/navigation/navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigation.push(
            context,
            HomeScreen(),
          );
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Form(
          child: Scaffold(
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
                    padding: EdgeInsets.all(
                      10.w,
                    ),
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
                          "Login",
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
                          "Enter your email and password",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(),
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
                          ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget Password?",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp, color: Colors.black),
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
                                  cubit.login();
                                },
                                child: Text(
                                  "Login",
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
                              "Don’t have an account?",
                              style: GoogleFonts.poppins(),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigation.push(
                                  context,
                                  SignUpScreen(),
                                );
                              },
                              child: Text(
                                "Sign Up",
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
          ),
        );
      },
    );
  }
}
