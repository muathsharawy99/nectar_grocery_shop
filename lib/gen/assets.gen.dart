// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();
  /// File path: assets/images/back.png
  AssetGenImage get back =>
      const AssetGenImage('assets/images/back.png');
  /// File path: assets/images/banana.png
  AssetGenImage get banana =>
      const AssetGenImage('assets/images/banana.png');
  /// File path: assets/images/carrot.png
  AssetGenImage get carrot =>
      const AssetGenImage('assets/images/carrot.png');
  /// File path: assets/images/carrot_colored.png
  AssetGenImage get carrotColored =>
      const AssetGenImage('assets/images/carrot_colored.png');
  /// File path: assets/images/deco.png
  AssetGenImage get deco =>
      const AssetGenImage('assets/images/deco.png');
  /// File path: assets/images/ginger.png
  AssetGenImage get ginger =>
      const AssetGenImage('assets/images/ginger.png');
  /// File path: assets/images/m.jpg
  AssetGenImage get m =>
      const AssetGenImage('assets/images/m.jpg');
  /// File path: assets/images/man.png
  AssetGenImage get man =>
      const AssetGenImage('assets/images/man.png');
  /// File path: assets/images/splash.png
  AssetGenImage get splash =>
      const AssetGenImage('assets/images/splash.png');
  /// File path: assets/images/top_color.png
  AssetGenImage get topColor =>
      const AssetGenImage('assets/images/top_color.png');
  /// File path: assets/images/vege.png
  AssetGenImage get vege =>
      const AssetGenImage('assets/images/vege.png');
  /// List of all assets
  List<AssetGenImage> get values => [
    back,
    banana,
    carrot,
    carrotColored,
    deco,
    ginger,
    m,
    man,
    splash,
    topColor,
    vege,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
