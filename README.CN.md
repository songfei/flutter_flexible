# flutter_flexible

[![Build Status](https://travis-ci.com/songfei/flutter_flexible.svg?branch=master)](https://travis-ci.com/songfei/flutter_flexible)
[![codecov](https://codecov.io/gh/songfei/flutter_flexible/branch/master/graph/badge.svg)](https://codecov.io/gh/songfei/flutter_flexible)


Flutter UI 可伸缩布局方案。

## 遇到问题

做移动端开发时， 视觉设计师通常只会输出一种屏幕的设计稿， 我们希望能够在不同的分辨率设备上，都能做到完美的适配。

## 实现方案

按宽度等比例适配， 最适合界面可以上下滚动的界面。


## 如何使用
引入头文件

```
import 'package:flexible/flexible.dart';

```

示例代码

```
 ScreenFlexibleWidget(  // 1. Wrap with `ScreenFlexibleWidget`
  child: Builder(
    builder: (BuildContext context) {
      return Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: flexible(context, 187.5),  // 2. All pixel value use `flexible` function , 375.0/2=187.5, 
                                                // this container is half the width of the screen on any device.
              height: flexible(context, 500.0),
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'A',
                  style: TextStyle(
                    fontSize: flexible(context, 200.0), // Text fontSize also use `flexible`
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  ),
);

```