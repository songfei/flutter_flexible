import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef BaseWidgetWidthCalculator<T> = double Function(
    double width, double height, double ration, T platform);

/// 确定基准 Widget的宽度， 一般是屏幕宽度， 所有使用 flexible 进行计算的时候，
/// 都会按照 Widget树 最近的一个 TEScreenFlexibleWidget 中指定的的 `baseWidgetWidth 来等比缩放。
class ScreenFlexibleWidget<T> extends StatelessWidget {
  final Widget child;

  final double baseWidgetWidth;
  final BaseWidgetWidthCalculator<T> calculator;
  final Widget backgroundWidget;

  final T platform;

  ScreenFlexibleWidget({
    @required this.child,
    this.baseWidgetWidth,
    this.calculator,
    this.backgroundWidget,
    this.platform,
  });

  @override
  Widget build(BuildContext context) {
    double width = window.physicalSize.width;
    double height = window.physicalSize.height;
    double ratio = window.devicePixelRatio;

    double baseWidth = baseWidgetWidth ?? width / ratio;
    if (calculator != null) {
      baseWidth = calculator(width / ratio, height / ratio, ratio, platform);
    }
    return ScreenFlexibleInheritedWidget(
      baseWidgetWidth: baseWidth,
      child: Stack(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          backgroundWidget ?? Container(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: baseWidth,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}

class ScreenFlexibleInheritedWidget extends InheritedWidget {
  final double baseWidgetWidth;

  ScreenFlexibleInheritedWidget({
    @required Widget child,
    @required this.baseWidgetWidth,
  }) : super(child: child);

  static ScreenFlexibleInheritedWidget of(BuildContext context) {
    final ScreenFlexibleInheritedWidget screenFlexibleInheritedWidget = context
        .dependOnInheritedWidgetOfExactType<ScreenFlexibleInheritedWidget>();
    assert(screenFlexibleInheritedWidget != null);
    return screenFlexibleInheritedWidget;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
