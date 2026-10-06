import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/blocs/cart/manager/cart_cubit.dart';
import 'package:nectaar/core/blocs/cart/manager/cart_state.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../manager/product_details_cubit.dart';
import '../manager/product_details_state.dart';
import '../widgets/product_detail_section.dart';
import '../widgets/product_image_header.dart';
import '../widgets/product_review_row.dart';
import '../widgets/product_title_row.dart';

/// One product: photo, name, quantity + price, details, review and
/// "Add To Basket" (through the app-wide [CartCubit]).
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsCubit cubit = sl<ProductDetailsCubit>();
  final CartCubit cartCubit = sl<CartCubit>();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() => cubit.getProduct(widget.id);

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  Widget _body(ProductDetailsState state) {
    if (state.status.isLoading || state.status.isInitial) {
      return const LoadingApp();
    }
    if (state.status.isError) {
      return CustomErrorWidget(
        title: state.msg.isNotEmpty
            ? state.msg
            : LocaleKeys.something_went_wrong_please_try_again.tr(),
        errorStatus: state.errorType,
        onTap: _load,
      );
    }
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const ProductImageHeader(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductTitleRow(
              product: state.product,
              isFavorite: state.isFavorite,
              onFavorite: cubit.toggleFavorite,
            ),
            SizedBox(height: AppSize.s25.h),
            Row(
              children: [
                QuantityCounter(
                  quantity: state.quantity,
                  onIncrement: cubit.increment,
                  onDecrement: cubit.decrement,
                ),
                const Spacer(),
                PriceWidget(
                  amount: state.product.priceText,
                  amountStyle: context.bold.copyWith(fontSize: FontSize.s20),
                ),
              ],
            ),
            SizedBox(height: AppSize.s25.h),
            const Divider(),
            ProductDetailSection(
              description: state.product.description,
              isExpanded: state.showDetails,
              onToggle: cubit.toggleDetails,
            ),
            const Divider(),
            ProductReviewRow(rating: state.rating, onRate: cubit.rate),
            SizedBox(height: AppSize.s25.h),
            BlocConsumer<CartCubit, CartState>(
              bloc: cartCubit,
              listenWhen: (p, c) => p.addStatus != c.addStatus,
              listener: (context, cart) {
                if (cart.addStatus.isDone) {
                  FlashHelper.showToast(
                    cart.addMsg.isNotEmpty
                        ? cart.addMsg
                        : LocaleKeys.product_added_to_basket.tr(),
                    type: MessageType.success,
                  );
                } else if (cart.addStatus.isError) {
                  FlashHelper.showToast(
                    cart.addMsg.isNotEmpty
                        ? cart.addMsg
                        : LocaleKeys.something_went_wrong_please_try_again
                              .tr(),
                  );
                }
              },
              builder: (context, cart) => ButtonWidget(
                title: LocaleKeys.product_add_to_basket.tr(),
                isLoading: cart.addStatus.isLoading,
                onTap: () => cartCubit.addToCart(
                  id: widget.id,
                  quantity: state.quantity,
                ),
              ),
            ),
            SizedBox(height: AppSize.s25.h),
          ],
        ).withPadding(horizontal: AppSize.screenPadding.w),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: const LightAppBar(transparent: true),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        bloc: cubit,
        builder: (context, state) => _body(state),
      ),
    );
  }
}
