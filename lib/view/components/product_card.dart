import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/color/color_assets.dart';
import 'package:nectaar/view/screens/productDetails_screen.dart';
import 'package:nectaar/view_model/navigation/navigation.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        15.r,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigation.push(
            context,
            ProductDetails(id: product.id ?? 0),
          );

        },
        child: SizedBox(
          width: 160.w,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              side: BorderSide(
                color: Color(0xffE2E2E2),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.w, 20.h, 10.w, 10.h),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      "assets/banana.png",
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.name ?? "Organic Bananas"}",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "7pcs, Price",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${product.price}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsetsDirectional.all(7.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                color: ColorAssets.green,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
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
