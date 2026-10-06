import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';

/// Body of a horizontal shop section: loader while the first page loads,
/// the error message with a retry, or the list itself.
class SectionStateView extends StatelessWidget {
  const SectionStateView({
    super.key,
    required this.status,
    required this.msg,
    required this.isEmpty,
    required this.onRetry,
    required this.child,
  });

  final RequestState status;
  final String msg;
  final bool isEmpty;
  final VoidCallback onRetry;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isEmpty && (status.isLoading || status.isInitial)) {
      return const LoadingApp();
    }
    if (isEmpty && status.isError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            msg,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.regular.copyWith(
              fontSize: FontSize.s13,
              color: context.mediumTextColor,
            ),
          ),
          IconButton(
            onPressed: onRetry,
            icon: Icon(Icons.refresh_rounded, color: context.primaryColor),
          ),
        ],
      ).withPadding(horizontal: AppSize.screenPadding.w);
    }
    return child;
  }
}
