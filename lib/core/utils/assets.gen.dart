/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bar.webp
  AssetGenImage get bar => const AssetGenImage('assets/images/bar.webp');

  /// File path: assets/images/beating_heart.webp
  AssetGenImage get favorite =>
      const AssetGenImage('assets/images/favorite.png');

  /// File path: assets/images/camera.webp
  AssetGenImage get camera => const AssetGenImage('assets/images/camera.png');

  /// File path: assets/images/clinking_glasses.webp
  AssetGenImage get cocktail =>
      const AssetGenImage('assets/images/cocktail.png');

  /// File path: assets/images/cocktail_glass.webp
  AssetGenImage get fun => const AssetGenImage('assets/images/fun.png');

  /// File path: assets/images/dark_placeholder.webp
  AssetGenImage get darkPlaceholder =>
      const AssetGenImage('assets/images/dark_placeholder.webp');

  /// File path: assets/images/email.webp
  AssetGenImage get email => const AssetGenImage('assets/images/email.webp');

  /// File path: assets/images/light_placeholder.webp
  AssetGenImage get lightPlaceholder =>
      const AssetGenImage('assets/images/light_placeholder.webp');

  /// File path: assets/images/logo.webp
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/party_popper.webp
  AssetGenImage get gift => const AssetGenImage('assets/images/gift.png');

  /// File path: assets/images/playstore.png
  AssetGenImage get playstore =>
      const AssetGenImage('assets/images/playstore.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bar,
        favorite,
        camera,
        gift,
        cocktail,
        darkPlaceholder,
        email,
        lightPlaceholder,
        logo,
        fun,
        playstore
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/adventure.json
  String get adventure => 'assets/json/adventure.json';

  /// File path: assets/json/cocktail_drink.json
  LottieGenImage get cocktailDrink =>
      const LottieGenImage('assets/json/cocktail_drink.json');

  /// File path: assets/json/empty.json
  LottieGenImage get empty => const LottieGenImage('assets/json/empty.json');

  /// File path: assets/json/latest.json
  String get latest => 'assets/json/latest.json';

  /// File path: assets/json/popular.json
  String get popular => 'assets/json/popular.json';

  /// File path: assets/json/turbine_empty.json
  LottieGenImage get turbineEmpty =>
      const LottieGenImage('assets/json/turbine_empty.json');

  /// List of all assets
  List<dynamic> get values =>
      [adventure, cocktailDrink, empty, latest, popular, turbineEmpty];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
