import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/components/favorite_bar.dart';

class FavoriteLayout extends StatelessWidget {
  const FavoriteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 10.h,
          ),
          Text(
            "Favorite",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Divider(
            thickness: 3,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => FavoriteBar(),
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              indent: 10.w,
              endIndent: 10.w,
            ),
            itemCount: 5,
          ),
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 100.h,
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
              onPressed: () {},
              child: Text(
                "Add All To Cart",
                style: GoogleFonts.poppins(),
              ),
                        ),
          )
        ],
      ),
    );
  }
}
