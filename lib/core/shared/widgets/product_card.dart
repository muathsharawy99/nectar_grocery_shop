import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../extensions/unified_extensions.dart';

/// Product tile used by the shop, explore and category screens. Opens the
/// product details on tap.
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.width});

  final ProductModel product;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.cardSurface,
      borderRadius: BorderRadius.circular(AppSize.borderRadius.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => push(
          NamedRoutes.productDetails,
          arg: {RouteString.id: product.id},
        ),
        child: Container(
          width: width,
          padding: EdgeInsetsDirectional.fromSTEB(
            AppSize.s10.w,
            AppSize.s20.h,
            AppSize.s10.w,
            AppSize.s10.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius.r),
            border: Border.all(color: context.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(Assets.images.banana.path).center.expand(flex: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.isEmpty
                        ? LocaleKeys.product_default_name.tr()
                        : product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.bold.copyWith(
                      fontSize: FontSize.s12,
                      height: 1,
                    ),
                  ),
                  Text(
                    LocaleKeys.product_available.tr(
                      args: ['${product.quantity}'],
                    ),
                    style: context.light.copyWith(fontSize: FontSize.s13),
                  ),
                  Row(
                    children: [
                      PriceWidget(
                        amount: product.priceText,
                        amountStyle: context.semiBold.copyWith(
                          fontSize: FontSize.s14,
                        ),
                      ).expand(),
                      Container(
                        padding: EdgeInsetsDirectional.all(AppSize.s7.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s10.r),
                          color: context.primaryColor,
                        ),
                        child: Icon(Icons.add, color: context.onPrimary),
                      ),
                    ],
                  ),
                ],
              ).expand(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
