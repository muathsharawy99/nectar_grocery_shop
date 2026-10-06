import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../manager/explore_cubit.dart';
import '../manager/explore_state.dart';

/// Explore tab: "Find Products", search and the products grid.
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ExploreCubit cubit = sl<ExploreCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getProducts();
  }

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  Widget _body(ExploreState state) {
    if (state.status.isLoading && state.products.isEmpty) {
      return const LoadingApp();
    }
    if (state.status.isError && state.products.isEmpty) {
      return CustomErrorWidget(
        title: state.msg,
        errorStatus: state.errorType,
        onTap: cubit.getProducts,
      );
    }
    if (state.status.isEmpty) {
      return CustomEmptyWidget(onTap: cubit.getProducts);
    }
    return RefreshIndicator.adaptive(
      color: context.primaryColor,
      onRefresh: cubit.getProducts,
      child: GridView.builder(
        padding: EdgeInsets.all(AppSize.screenPadding.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: AppSize.s8.w,
          mainAxisSpacing: AppSize.s8.h,
        ),
        itemCount: state.products.length,
        itemBuilder: (_, i) => ProductCard(product: state.products[i]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      bloc: cubit,
      builder: (context, state) => Column(
        children: [
          SizedBox(height: AppSize.s10.h),
          Text(
            LocaleKeys.explore_title.tr(),
            style: context.bold.copyWith(fontSize: FontSize.s20),
          ),
          SizedBox(height: AppSize.s15.h),
          const SearchField().withPadding(horizontal: AppSize.screenPadding.w),
          _body(state).expand(),
        ],
      ),
    );
  }
}
