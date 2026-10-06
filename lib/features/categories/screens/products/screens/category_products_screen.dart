import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';

import '../manager/category_products_cubit.dart';
import '../manager/category_products_state.dart';

/// Products of one category in a grid.
class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({
    super.key,
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  State<CategoryProductsScreen> createState() =>
      _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final CategoryProductsCubit cubit = sl<CategoryProductsCubit>();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() => cubit.getProducts(widget.id);

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: LightAppBar(title: widget.name),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.status.isLoading && state.products.isEmpty) {
            return const LoadingApp();
          }
          if (state.status.isError && state.products.isEmpty) {
            return CustomErrorWidget(
              title: state.msg,
              errorStatus: state.errorType,
              onTap: _load,
            );
          }
          if (state.status.isEmpty) {
            return CustomEmptyWidget(onTap: _load);
          }
          return RefreshIndicator.adaptive(
            color: context.primaryColor,
            onRefresh: _load,
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
        },
      ),
    );
  }
}
