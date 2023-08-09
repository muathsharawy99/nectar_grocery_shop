import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';

class CartItem extends StatelessWidget {
  final Product? cartProduct;

  const CartItem({required this.cartProduct, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SizedBox(
          height: 126.h,
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  "assets/ginger.png",
                ),
                isThreeLine: true,
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${cartProduct?.name}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "1kg, Price",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorAssets.textGrey,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.decrementCounter();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.minus,
                      ),
                    ),
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          width: 2.w,
                          color: const Color(
                            0xffE2E2E2,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(
                          15.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${cubit.counter}",
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cubit.incrementCounter();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.plus,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${cartProduct?.price}",
                      // ${cubit.currentProduct?.price}
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                height: 25.h,
              )
            ],
          ),
        );
      },
    );
  }
}
