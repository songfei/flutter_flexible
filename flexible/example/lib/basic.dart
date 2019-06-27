import 'dart:ui';

import 'package:flexible/flexible.dart';
import 'package:flutter/material.dart';

class BasicLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);

    return ScreenFlexibleWidget(
      calculator: (double width, double height, double ratio, dynamic platform) {
        print(width);
        return width * 0.8;
      },
      backgroundWidget: Container(
        color: Colors.deepOrangeAccent,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('基本布局')),
        body: TestWidget(),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = window.physicalSize.width;
    final height = window.physicalSize.height;
    final ratio = window.devicePixelRatio;

    return ScreenFlexibleWidget(
      calculator: (double width, double height, double ratio, dynamic platform) {
        print(width);
        return width * 0.6;
      },
      backgroundWidget: Container(
        color: Colors.pink,
      ),
      child: Builder(
        builder: (BuildContext context) {
          return Container(
            color: Colors.yellow,
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                  width: flexible(context, 375.0 / 2),
                  height: flexible(context, 30),
                  color: Colors.red,
                ),
                Text(
                  '$width x $height  $ratio',
                  style: TextStyle(fontSize: flexible(context, 13.0)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
