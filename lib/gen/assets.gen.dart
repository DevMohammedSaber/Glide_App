/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/add_card.png
  AssetGenImage get addCard => const AssetGenImage('assets/png/add_card.png');

  /// File path: assets/png/apple_pay.png
  AssetGenImage get applePay => const AssetGenImage('assets/png/apple_pay.png');

  /// File path: assets/png/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/png/banner.png');

  /// File path: assets/png/cash.png
  AssetGenImage get cash => const AssetGenImage('assets/png/cash.png');

  /// File path: assets/png/empty.png
  AssetGenImage get empty => const AssetGenImage('assets/png/empty.png');

  /// File path: assets/png/mastercard.png
  AssetGenImage get mastercard =>
      const AssetGenImage('assets/png/mastercard.png');

  /// File path: assets/png/onboarding.png
  AssetGenImage get onboarding =>
      const AssetGenImage('assets/png/onboarding.png');

  /// File path: assets/png/visa.png
  AssetGenImage get visa => const AssetGenImage('assets/png/visa.png');

  /// File path: assets/png/wallet_card_background.png
  AssetGenImage get walletCardBackground =>
      const AssetGenImage('assets/png/wallet_card_background.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    addCard,
    applePay,
    banner,
    cash,
    empty,
    mastercard,
    onboarding,
    visa,
    walletCardBackground,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/buildings.svg
  String get buildings => 'assets/svg/buildings.svg';

  /// File path: assets/svg/bus.svg
  String get bus => 'assets/svg/bus.svg';

  /// File path: assets/svg/bus_trip.svg
  String get busTrip => 'assets/svg/bus_trip.svg';

  /// File path: assets/svg/dark_glide_logo.svg
  String get darkGlideLogo => 'assets/svg/dark_glide_logo.svg';

  /// File path: assets/svg/elder.svg
  String get elder => 'assets/svg/elder.svg';

  /// File path: assets/svg/food.svg
  String get food => 'assets/svg/food.svg';

  /// File path: assets/svg/google.svg
  String get google => 'assets/svg/google.svg';

  /// File path: assets/svg/history.svg
  String get history => 'assets/svg/history.svg';

  /// File path: assets/svg/history_filled.svg
  String get historyFilled => 'assets/svg/history_filled.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/home_filled.svg
  String get homeFilled => 'assets/svg/home_filled.svg';

  /// File path: assets/svg/home_outlined.svg
  String get homeOutlined => 'assets/svg/home_outlined.svg';

  /// File path: assets/svg/light_glide_logo.svg
  String get lightGlideLogo => 'assets/svg/light_glide_logo.svg';

  /// File path: assets/svg/market.svg
  String get market => 'assets/svg/market.svg';

  /// File path: assets/svg/medicine.svg
  String get medicine => 'assets/svg/medicine.svg';

  /// File path: assets/svg/more.svg
  String get more => 'assets/svg/more.svg';

  /// File path: assets/svg/profile.svg
  String get profile => 'assets/svg/profile.svg';

  /// File path: assets/svg/profile_filled.svg
  String get profileFilled => 'assets/svg/profile_filled.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// File path: assets/svg/taxi.svg
  String get taxi => 'assets/svg/taxi.svg';

  /// File path: assets/svg/taxi_trip.svg
  String get taxiTrip => 'assets/svg/taxi_trip.svg';

  /// File path: assets/svg/wallet_logo.svg
  String get walletLogo => 'assets/svg/wallet_logo.svg';

  /// File path: assets/svg/work.svg
  String get work => 'assets/svg/work.svg';

  /// List of all assets
  List<String> get values => [
    buildings,
    bus,
    busTrip,
    darkGlideLogo,
    elder,
    food,
    google,
    history,
    historyFilled,
    home,
    homeFilled,
    homeOutlined,
    lightGlideLogo,
    market,
    medicine,
    more,
    profile,
    profileFilled,
    search,
    taxi,
    taxiTrip,
    walletLogo,
    work,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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
