import 'package:flutter/widgets.dart';

import 'screen_flexible_widget.dart';

class ScreenFlexible {
  //这个是设计稿的屏幕宽度， 默认是按 iPhone6, iPhoneX 的尺寸， 宽度 375。
  static double _designScreenWidth = 375.0;

  static set designScreenWidth(double width) {
    _designScreenWidth = width;
  }

  static double getFinalValue(
    double value,
    double baseWidgetWidth, {
    double minValue,
    double maxValue,
  }) {
    double result = ((value * baseWidgetWidth) / _designScreenWidth);
    if (minValue != null && result < minValue) {
      result = minValue;
    }
    if (maxValue != null && result > maxValue) {
      result = maxValue;
    }
    return result;
  }
}

/// 适配屏幕的宽高像素值转换
/// `value` 表示设计稿中的控件尺寸
double flexible(
  BuildContext context,
  double value, {
  double minValue,
  double maxValue,
}) {
  double baseWidgetWidth = ScreenFlexibleWidget.of(context).baseWidgetWidth;
  return ScreenFlexible.getFinalValue(
    value,
    baseWidgetWidth,
    minValue: minValue,
    maxValue: maxValue,
  );
}
