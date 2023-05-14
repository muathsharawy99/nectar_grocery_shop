import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';

class ProductDetails extends StatelessWidget {
  final int id;

  ProductDetails({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeCubit()..getProductById(id),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.file_upload_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          30.r,
                        ),
                        bottomRight: Radius.circular(
                          30.r,
                        ),
                      ),
                      color: Color(
                        0xffF2F3F2,
                      ),
                    ),
                    child: Image.asset(
                      "assets/banana.png",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${cubit.currentProduct?.name}",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.changeFavorite();
                              },
                              icon: cubit.isFavorite
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                    ),
                            ),
                          ],
                        ),
                        Text(
                          "Available : ${cubit.currentProduct?.quantity}",
                          style: GoogleFonts.poppins(
                            color: ColorAssets.textGrey,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cubit.decrementCounter();
                              },
                              icon: Icon(
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
                                  color: Color(
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
                              icon: Icon(
                                FontAwesomeIcons.plus,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "\$${cubit.currentProduct?.price}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Divider(
                          thickness: 1.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Visibility(
                          visible: cubit.isVisible,
                          replacement: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Product Detail",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cubit.changeVisibility();
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.angleRight,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Product Detail",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cubit.changeVisibility();
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.angleDown,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "${cubit.currentProduct?.description}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: GoogleFonts.poppins(
                                  color: ColorAssets.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          thickness: 1.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Review",
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RatingBar(
                              initialRating: 3,
                              itemSize: 30.w,
                              glow: false,
                              itemCount: 5,
                              allowHalfRating: true,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star,
                                  color: ColorAssets.red,
                                ),
                                half: Icon(
                                  Icons.star_half,
                                  color: ColorAssets.red,
                                ),
                                empty: Icon(
                                  Icons.star_border,
                                  color: ColorAssets.red,
                                ),
                              ),
                              onRatingUpdate: (rate) {
                                print(rate);
                              },
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.angleRight,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Container(
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
                                cubit.addToCart(cubit.counter);
                              },
                              child: Text(
                                "Add To Basket",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
