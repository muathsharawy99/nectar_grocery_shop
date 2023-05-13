import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class GroceriesCard extends StatelessWidget {
  const GroceriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int randomColor = (math.Random().nextDouble() * 0xFFF8A44CB2).toInt();
    return Material(
      borderRadius: BorderRadius.circular(
        15.r,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 230.w,
          child: Card(
            color: Color(randomColor).withOpacity(.5
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              side: BorderSide.none
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.all(10.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      "assets/banana.png",
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    flex: 5,
                    child: Wrap(
                      children: [
                        Text(
                          "Bananas",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            height: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
