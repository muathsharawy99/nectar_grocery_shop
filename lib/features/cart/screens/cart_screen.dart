import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/blocs/cart/manager/cart_cubit.dart';
import 'package:nectaar/core/blocs/cart/manager/cart_state.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../widgets/cart_item.dart';

/// Cart tab: "My Cart" and the lines of the app-wide [CartCubit].
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<CartCubit>();
    return Column(
      children: [
        SizedBox(height: AppSize.s20.h),
        Text(
          LocaleKeys.cart_title.tr(),
          style: context.bold.copyWith(fontSize: FontSize.s20),
        ),
        SizedBox(height: AppSize.s20.h),
        const Divider(),
        BlocBuilder<CartCubit, CartState>(
          bloc: cubit,
          builder: (context, state) {
            if (state.status.isLoading && state.items.isEmpty) {
              return const LoadingApp();
            }
            if (state.status.isError && state.items.isEmpty) {
              return CustomErrorWidget(
                title: state.msg,
                errorStatus: state.errorType,
                onTap: cubit.getCart,
              );
            }
            if (state.status.isDone && state.items.isEmpty) {
              return CustomEmptyWidget(
                errorMessage: LocaleKeys.cart_empty.tr(),
                onTap: cubit.getCart,
              );
            }
            return RefreshIndicator.adaptive(
              color: context.primaryColor,
              onRefresh: cubit.getCart,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.screenPadding.w,
                ),
                itemCount: state.items.length,
                separatorBuilder: (_, _) => const Divider(),
                itemBuilder: (_, i) {
                  final item = state.items[i];
                  return CartItem(
                    product: item,
                    quantity: state.quantityOf(item.id),
                    onIncrement: () => cubit.increment(item.id),
                    onDecrement: () => cubit.decrement(item.id),
                  );
                },
              ),
            );
          },
        ).expand(),
      ],
    );
  }
}
