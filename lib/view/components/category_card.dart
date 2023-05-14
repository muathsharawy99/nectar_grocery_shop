import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/screens/categoryDetails_screen.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';
import 'package:nectaar/view_model/navigation/navigation.dart';

class CategoryCard extends StatelessWidget {
  final Product? category;

  const CategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int randomColor = (math.Random().nextDouble() * 0xFFF8A44CB2).toInt();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Material(
          borderRadius: BorderRadius.circular(
            15.r,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              Navigation.push(
                context,
                CategoryDetails(id: category?.id ?? 0, name: category?.name ?? ''),
              );
            },
            child: SizedBox(
              height: 160.h,
              width: 160.w,
              child: Card(
                color: Color(randomColor).withOpacity(.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15.r,
                  ),
                  side: BorderSide(
                    color: Color(randomColor),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.all(10.w),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          "assets/banana.png",
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                        width: double.infinity,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${category?.name}",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
