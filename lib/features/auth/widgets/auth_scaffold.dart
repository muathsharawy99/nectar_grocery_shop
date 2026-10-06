import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/assets.gen.dart';

/// Auth page frame: the soft colored top background, an optional back
/// button, scrolling content and an optional floating "next" button.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.child,
    this.withBack = false,
    this.onNext,
    this.reverse = false,
  });

  final Widget child;
  final bool withBack;

  /// Shows the round green "next" button when set.
  final VoidCallback? onNext;

  /// Keeps the bottom of the form above the keyboard.
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: withBack
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: context.defaultTextColor,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        reverse: reverse,
        child: Stack(
          children: [
            CustomImage(
              Assets.images.topColor.path,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.screenPadding.w,
                vertical: AppSize.s10.h,
              ),
              child: child,
            ),
          ],
        ),
      ),
      floatingActionButton: onNext == null
          ? null
          : SizedBox.square(
              dimension: AppSize.s67.w,
              child: FloatingActionButton(
                elevation: 0,
                shape: const CircleBorder(),
                backgroundColor: context.primaryColor,
                onPressed: onNext,
                child: Icon(Icons.arrow_forward_ios, color: context.onPrimary),
              ),
            ),
    );
  }
}
