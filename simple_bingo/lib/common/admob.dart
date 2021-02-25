import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';

class Admob {
  static void setup() {
    FirebaseAdMob.instance.initialize(appId: _appId);
    _myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  static double height(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    print("画面サイズ: ${screenSize}");
    print("画面の横幅: ${screenSize.width}");
    print("画面の高さ: ${screenSize.height}");

    // 画面の高さ(dp)によって表示広告(スマートバナー)の高さをセット
    if (screenSize.height > 720) {
      return 90.0;
    } else if (screenSize.height > 400) {
      return 50.0;
    } else {
      return 32.0;
    }
    return _myBanner.size.height.toDouble();
  }

  static MobileAdTargetingInfo _targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['ビンゴ', '年末', '忘年会', '幹事', '打ち上げ'],
    childDirected: false,
    testDevices: <String>[],
  );

  static BannerAd _myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.smartBanner,
    targetingInfo: _targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  static final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-7093305833453939/7690328110'
      : 'ca-app-pub-7093305833453939/1883290054';

  static final String _appId = Platform.isAndroid
      ? 'ca-app-pub-7093305833453939~3850429109'
      : 'ca-app-pub-7093305833453939~8448698404';
}
