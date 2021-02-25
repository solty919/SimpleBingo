import 'package:flutter/material.dart';

extension DisplayType on MediaQueryData {
  bool isMobile() {
    var shortestSide = this.size.shortestSide;
    return shortestSide < 728;
  }
}
