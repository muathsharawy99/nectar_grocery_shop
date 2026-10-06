import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectaar/core/blocs/cart/manager/cart_cubit.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/core/services/service_locator.dart';

import '../../account/screens/account_screen.dart';
import '../../cart/screens/cart_screen.dart';
import '../../explore/screens/explore_screen.dart';
import '../../favorite/screens/favorite_screen.dart';
import '../../shop/screens/shop_screen.dart';
import '../data/layout_tab.dart';
import '../manager/layout_cubit.dart';
import '../widgets/app_bottom_nav_bar.dart';

/// The app shell after sign in: the five tabs kept alive in an
/// [IndexedStack], with the bottom navigation. Back on another tab goes to
/// the shop tab first.
class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final LayoutCubit cubit = sl<LayoutCubit>();

  @override
  void initState() {
    super.initState();
    sl<CartCubit>().getCart();
  }

  @override
  void dispose() {
    if (!cubit.isClosed) cubit.close();
    super.dispose();
  }

  Widget _tab(LayoutTab tab) => switch (tab) {
    LayoutTab.shop => const ShopScreen(),
    LayoutTab.explore => const ExploreScreen(),
    LayoutTab.cart => const CartScreen(),
    LayoutTab.favorite => const FavoriteScreen(),
    LayoutTab.account => const AccountScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, int>(
      bloc: cubit,
      builder: (context, index) => PopScope(
        canPop: index == LayoutTab.shop.index,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) cubit.changeTab(LayoutTab.shop.index);
        },
        child: Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          body: SafeArea(
            child: IndexedStack(
              index: index,
              children: [for (final tab in LayoutTab.values) _tab(tab)],
            ),
          ),
          bottomNavigationBar: AppBottomNavBar(
            currentIndex: index,
            onTap: cubit.changeTab,
          ),
        ),
      ),
    );
  }
}
