import 'dart:ui';

import 'package:flexible/flexible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('默认宽度测试', (WidgetTester tester) async {
    double value;

    await tester.pumpWidget(ScreenFlexibleWidget(
      child: Builder(
        builder: (BuildContext context) {
          value = flexible(context, 375.0);
          return Container();
        },
      ),
    ));

    double width = window.physicalSize.width / window.devicePixelRatio;
    expect(value, width);
  });

  testWidgets('设置宽度测试', (WidgetTester tester) async {
    double value;

    await tester.pumpWidget(ScreenFlexibleWidget(
      baseWidgetWidth: 750.0,
      child: Builder(
        builder: (BuildContext context) {
          value = flexible(context, 375.0);
          return Container();
        },
      ),
    ));

    expect(value, 750.0);
  });

  testWidgets('最大值测试', (WidgetTester tester) async {
    double value;

    await tester.pumpWidget(ScreenFlexibleWidget(
      baseWidgetWidth: 750.0,
      child: Builder(
        builder: (BuildContext context) {
          value = flexible(context, 375.0, maxValue: 200.0);
          return Container();
        },
      ),
    ));

    expect(value, 200.0);
  });

  testWidgets('最小值测试', (WidgetTester tester) async {
    double value;

    await tester.pumpWidget(ScreenFlexibleWidget(
      baseWidgetWidth: 750.0,
      child: Builder(
        builder: (BuildContext context) {
          value = flexible(context, 375.0, minValue: 800.0);
          return Container();
        },
      ),
    ));

    expect(value, 800.0);
  });
}
