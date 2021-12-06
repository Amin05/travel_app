import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double w(double val) {
    return MediaQuery.of(this).size.width * (val / 375);
  }

  double h(double val) {
    return MediaQuery.of(this).size.height * (val / 812);
  }
}
