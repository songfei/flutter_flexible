import 'package:flutter/widgets.dart';

/// 确定基准 Widget的宽度， 一般是屏幕宽度， 所有使用 flexible 进行计算的时候，
/// 都会按照 Widget树 最近的一个 TEScreenFlexibleWidget 中指定的的 `baseWidgetWidth 来等比缩放。
class ScreenFlexibleWidget extends InheritedWidget {
  final double baseWidgetWidth;

  ScreenFlexibleWidget({this.baseWidgetWidth = 375.0, Widget child})
      : super(
          child: Container(
            width: baseWidgetWidth,
            child: child,
          ),
        );

  static ScreenFlexibleWidget of(BuildContext context) {
    final ScreenFlexibleWidget screenFlexibleWidget =
        context.inheritFromWidgetOfExactType(ScreenFlexibleWidget);
    assert(screenFlexibleWidget != null);
    return screenFlexibleWidget;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
