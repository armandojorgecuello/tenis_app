/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/LOGO HEADER.svg
  String get logoHeader => 'assets/images/LOGO HEADER.svg';

  /// File path: assets/images/LOGO.svg
  String get logo => 'assets/images/LOGO.svg';

  /// File path: assets/images/arrow_down.svg
  String get arrowDown => 'assets/images/arrow_down.svg';

  /// File path: assets/images/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/calendar.svg
  String get calendar => 'assets/images/calendar.svg';

  /// File path: assets/images/cancha_multiple.png
  AssetGenImage get canchaMultiple =>
      const AssetGenImage('assets/images/cancha_multiple.png');

  /// File path: assets/images/epic_box.png
  AssetGenImage get epicBox =>
      const AssetGenImage('assets/images/epic_box.png');

  /// File path: assets/images/location.svg
  String get location => 'assets/images/location.svg';

  /// File path: assets/images/login_background_header.jpg
  AssetGenImage get loginBackgroundHeader =>
      const AssetGenImage('assets/images/login_background_header.jpg');

  /// File path: assets/images/person.svg
  String get person => 'assets/images/person.svg';

  /// File path: assets/images/rusty_tenis.png
  AssetGenImage get rustyTenis =>
      const AssetGenImage('assets/images/rusty_tenis.png');

  /// File path: assets/images/tennis.svg
  String get tennis => 'assets/images/tennis.svg';

  /// File path: assets/images/watch.svg
  String get watch => 'assets/images/watch.svg';

  /// File path: assets/images/weather.svg
  String get weather => 'assets/images/weather.svg';

  /// List of all assets
  List<dynamic> get values => [
    logoHeader,
    logo,
    arrowDown,
    background,
    calendar,
    canchaMultiple,
    epicBox,
    location,
    loginBackgroundHeader,
    person,
    rustyTenis,
    tennis,
    watch,
    weather,
  ];
}

class MyAssets {
  const MyAssets._();

  static const String aEnv = '.env.development';
  static const String pEnv = '.env.production';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv, aEnv];
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
