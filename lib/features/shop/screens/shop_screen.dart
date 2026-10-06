import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../manager/shop_cubit.dart';
import '../manager/shop_state.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/categories_section.dart';
import '../widgets/products_section.dart';
import '../widgets/shop_header.dart';

/// Shop tab: header, search, promo banners, exclusive offers (products) and
/// the categories row.
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ShopCubit cubit = sl<ShopCubit>();

  @override
  void initState() {
    super.initState();
    cubit.load();
  }

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      bloc: cubit,
      builder: (context, state) => RefreshIndicator.adaptive(
        color: context.primaryColor,
        onRefresh: cubit.load,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: AppSize.s10.h),
          children: [
            const ShopHeader(),
            SizedBox(height: AppSize.s10.h),
            const SearchField().withPadding(
              horizontal: AppSize.screenPadding.w,
            ),
            SizedBox(height: AppSize.s10.h),
            const BannerCarousel(),
            ProductsSection(
              title: LocaleKeys.shop_exclusive_offer.tr(),
              products: state.products,
              status: state.productsStatus,
              msg: state.productsMsg,
              onRetry: cubit.getProducts,
            ),
            SizedBox(height: AppSize.s10.h),
            CategoriesSection(
              title: LocaleKeys.shop_categories.tr(),
              categories: state.categories,
              status: state.categoriesStatus,
              msg: state.categoriesMsg,
              onRetry: cubit.getCategories,
            ),
          ],
        ),
      ),
    );
  }
}
