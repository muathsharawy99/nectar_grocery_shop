import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/unified_extensions.dart';

enum ImageType {
  network,
  networkSvg,
  assetSvg,
  file,
  asset,
  error;

  bool get isNetwork => this == network;
  bool get isAsset => this == asset;
  bool get isFile => this == file;
  bool get isError => this == error;
  bool get isNetworkSvg => this == networkSvg;
  bool get isAssetSvg => this == assetSvg;
}

ImageType resolveImageType(String? url, {bool isFile = false}) {
  if (url == null || url.trim().isEmpty) return ImageType.error;

  final normalizedUrl = url.trim();
  final uri = Uri.tryParse(normalizedUrl);
  final lowerUrl = normalizedUrl.toLowerCase();
  final cleanPath = lowerUrl.split('?').first.split('#').first;
  final extension = cleanPath.split('.').last;
  final isHttp = uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  final isLocalFile =
      isFile ||
      lowerUrl.startsWith('file://') ||
      normalizedUrl.startsWith('/') ||
      normalizedUrl.startsWith('./') ||
      normalizedUrl.startsWith('../');

  if (isHttp && extension == 'svg') return ImageType.networkSvg;
  if (isHttp) return ImageType.network;
  if (extension == 'svg') return ImageType.assetSvg;
  if (isLocalFile) return ImageType.file;
  return ImageType.asset;
}

/// One widget for every image source: network (cached), svg (network or
/// asset), local file and asset. Falls back to initials of [fallbackName]
/// or a broken-image icon.
class CustomImage extends StatelessWidget {
  final double? height, width;
  final String? url;
  final bool isFile;
  final BoxFit fit;
  final BoxBorder? border;
  final Widget? child;

  final Color? blurColor, color, backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final bool matchDirection;
  final EdgeInsetsGeometry? padding;
  final String? fallbackText;
  final String? fallbackName;
  final void Function()? onTap;

  const CustomImage(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.isFile = false,
    this.borderRadius,
    BoxFit? fit,
    this.color,
    this.backgroundColor,
    this.border,
    this.child,
    bool? matchDirection,
    this.blurColor,
    this.padding,
    this.fallbackText,
    this.fallbackName,
    this.onTap,
  }) : fit = fit ?? BoxFit.contain,
       matchDirection = matchDirection ?? false;

  static String? _initials(String? name) {
    if (name == null || name.trim().isEmpty) return null;
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length >= 2) {
      String i1 = words[0].isNotEmpty ? words[0][0] : '';
      String i2 = words[1].isNotEmpty ? words[1][0] : '';
      return (i1 + i2).toUpperCase();
    }
    final w = words[0];
    if (w.isEmpty) return null;
    return w.substring(0, 1).toUpperCase();
  }

  String? get _effectiveFallback => _initials(fallbackName ?? fallbackText);

  ImageType _getImageType() => resolveImageType(url, isFile: isFile);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.zero,
          color: backgroundColor,
          border: border,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _buildImage(context),
              if (blurColor != null)
                Container(
                  height: height,
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius ?? BorderRadius.zero,
                    color: blurColor,
                  ),
                ),
              ?child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    switch (_getImageType()) {
      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: url!.trim(),
          height: height,
          width: width,
          fit: fit,
          color: color,
          placeholder: (context, _) => Container(
            height: height,
            width: width,
            color: context.surfaceVariant,
          ),
          errorWidget: (context, _, _) => _errorWidget(context),
        );
      case ImageType.networkSvg:
        return SvgPicture.network(
          url!.trim(),
          height: height,
          width: width,
          fit: fit,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
          placeholderBuilder: (context) =>
              SizedBox(height: height, width: width),
          errorBuilder: (context, _, _) => _errorWidget(context),
        );
      case ImageType.assetSvg:
        return SvgPicture.asset(
          url!,
          height: height,
          matchTextDirection: matchDirection,
          width: width,
          fit: fit,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        );
      case ImageType.file:
        return Image.file(
          File(url!.replaceFirst('file://', '')),
          height: height,
          width: width,
          fit: fit,
          color: color,
          errorBuilder: (context, error, stackTrace) => _errorWidget(context),
        );
      case ImageType.asset:
        return Image.asset(
          url!,
          width: width,
          height: height,
          fit: fit,
          color: color,
          matchTextDirection: matchDirection,
          errorBuilder: (context, error, stackTrace) => _errorWidget(context),
        );
      case ImageType.error:
        return _errorWidget(context);
    }
  }

  Widget _errorWidget(BuildContext context) {
    final initials = _effectiveFallback;
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: initials != null
            ? context.primaryContainer
            : context.surfaceVariant,
      ),
      height: height,
      width: width,
      alignment: Alignment.center,
      child: initials != null
          ? Text(
              initials,
              style: context.bold.copyWith(
                fontSize:
                    (((height ?? 40) < (width ?? 40)
                        ? (height ?? 40)
                        : (width ?? 40)) *
                    0.35),
                color: context.primaryColor,
              ),
            )
          : FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.broken_image_outlined,
                color: context.hintColor,
                size: AppSize.s24.w,
              ),
            ),
    );
  }
}
