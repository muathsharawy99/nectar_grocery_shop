import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/components/cart_item.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';

class CartLayout extends StatelessWidget {
  const CartLayout({Key? key}) : super(key: key);

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
                  height: 20.h,
                ),
                Text(
                  "My Cart",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Divider(
                  height: 20.h,
                  thickness: 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CartItem(
                            cartProduct:
                                cubit.cartProduct?.product?[index] ??
                                    Product(),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 1.h,
                          ),
                      itemCount: cubit.cartProduct?.product?.length ?? 0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
