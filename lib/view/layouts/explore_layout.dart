import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/components/product_card.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';

class ExploreLayout extends StatelessWidget {
  const ExploreLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 10.h,
                ),
                Text(
                  "Find Products",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    hintText: "Search Store",
                    hintStyle: GoogleFonts.poppins(),
                    fillColor: const Color(0xffF2F3F2),
                    prefixIconColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GridView.count(
                  childAspectRatio: 3 / 4,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                    10,
                    (index) => ProductCard(
                      product: cubit.productModel?.data?.product?[index] ??
                          Product(),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
