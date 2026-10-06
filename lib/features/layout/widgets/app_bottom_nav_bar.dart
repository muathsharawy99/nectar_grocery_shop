import 'package:flutter/material.dart';

import '../data/layout_tab.dart';

/// The five tabs (colors and sizes come from the theme).
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        for (final tab in LayoutTab.values)
          BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.label),
      ],
    );
  }
}
