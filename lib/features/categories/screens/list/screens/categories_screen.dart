import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../manager/categories_cubit.dart';
import '../manager/categories_state.dart';
import '../widgets/category_card.dart';

/// All categories in a grid; a tile opens its products.
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesCubit cubit = sl<CategoriesCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getCategories();
  }

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  void _open(CategoryModel category) => push(
    NamedRoutes.categoryProducts,
    arg: {RouteString.id: category.id, RouteString.name: category.name},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: LightAppBar(title: LocaleKeys.categories_title.tr()),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.status.isLoading && state.categories.isEmpty) {
            return const LoadingApp();
          }
          if (state.status.isError && state.categories.isEmpty) {
            return CustomErrorWidget(
              title: state.msg,
              errorStatus: state.errorType,
              onTap: cubit.getCategories,
            );
          }
          if (state.status.isEmpty) {
            return CustomEmptyWidget(onTap: cubit.getCategories);
          }
          return RefreshIndicator.adaptive(
            color: context.primaryColor,
            onRefresh: cubit.getCategories,
            child: GridView.builder(
              padding: EdgeInsets.all(AppSize.screenPadding.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppSize.s10.w,
                mainAxisSpacing: AppSize.s10.h,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, i) => CategoryCard(
                category: state.categories[i],
                color: context.categoryColor(i),
                onTap: () => _open(state.categories[i]),
              ),
            ),
          );
        },
      ),
    );
  }
}
