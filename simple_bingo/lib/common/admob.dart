import 'dart:io';

import 'package:bingo/common/extension/media_query_data+.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class Admob {
  static BannerAd banner;
  static void setup(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: _appId);
    banner = _makeBanner(context)
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  static MobileAdTargetingInfo _targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['ビンゴ', '年末', '忘年会', '幹事', '打ち上げ'],
    childDirected: false,
    testDevices: <String>[],
  );

  static BannerAd _makeBanner(BuildContext context) {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: MediaQuery.of(context).isMobile()
          ? AdSize.banner
          : AdSize.leaderboard,
      targetingInfo: _targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
  }

  static final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-7093305833453939/7690328110'
      : 'ca-app-pub-7093305833453939/1883290054';

  static final String _appId = Platform.isAndroid
      ? 'ca-app-pub-7093305833453939~3850429109'
      : 'ca-app-pub-7093305833453939~8448698404';
}
