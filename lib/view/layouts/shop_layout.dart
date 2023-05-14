import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/components/banner.dart';
import 'package:nectaar/view/components/exclusive_offer.dart';
import 'package:nectaar/view/components/groceries.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Image.asset(
              "assets/carrot_colored.png",
              width: 50.w,
              height: 50.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                ),
                Text(
                  "Dhaka, Banassre",
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - (35.w),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  hintText: "Search Store",
                  hintStyle: GoogleFonts.poppins(),
                  fillColor: Color(0xffF2F3F2),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CarouselSlider(
              items: [
                Baner(),
                Baner(),
                Baner(),
              ],
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 19 / 6,
              ),
            ),
            ExclusiveOffer(
              category: "ExclusiveOffer",
            ),
            SizedBox(
              height: 10.h,
            ),
            Groceries(
              category: "Categories",
            )
          ],
        ),
      ),
    );
  }
}
