import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

import 'promo_banner.dart';

/// Auto-playing promo banners with page dots.
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  static const _count = 3;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _controller = PageController(viewportFraction: .9);
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(AppConstants.bannerInterval, (_) {
      if (!_controller.hasClients) return;
      _controller.animateToPage(
        (_page + 1) % BannerCarousel._count,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 19 / 6,
          child: PageView.builder(
            controller: _controller,
            itemCount: BannerCarousel._count,
            onPageChanged: (page) => setState(() => _page = page),
            itemBuilder: (_, _) => const PromoBanner().withPadding(
              horizontal: AppSize.s5.w,
            ),
          ),
        ),
        SizedBox(height: AppSize.s8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < BannerCarousel._count; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: EdgeInsets.symmetric(horizontal: AppSize.s2.w),
                width: (i == _page ? AppSize.s16 : AppSize.s5).w,
                height: AppSize.s5.w,
                decoration: BoxDecoration(
                  color: i == _page
                      ? context.primaryColor
                      : context.borderColor,
                  borderRadius: BorderRadius.circular(AppSize.radiusFull.r),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
