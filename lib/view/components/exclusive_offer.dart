import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/components/product_card.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';

class ExclusiveOffer extends StatelessWidget {
  ExclusiveOffer({required this.category, Key? key}) : super(key: key);
  String? category;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 10.w,
                end: 10.w,
              ),
              child: Row(
                children: [
                  Text(
                    "$category",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                padding: EdgeInsetsDirectional.only(
                  start: 10.w,
                  end: 10.w,
                ),
                itemBuilder: (context, index) => ProductCard(
                    product:
                        cubit.productModel?.data?.product?[index] ?? Product()),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: 5.w,
                ),
                itemCount: cubit.productModel?.data?.product?.length ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }
}
