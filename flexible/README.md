# flutter_flexible

[![Build Status](https://travis-ci.com/songfei/flutter_flexible.svg?branch=master)](https://travis-ci.com/songfei/flutter_flexible)
[![codecov](https://codecov.io/gh/songfei/flutter_flexible/branch/master/graph/badge.svg)](https://codecov.io/gh/songfei/flutter_flexible)


Flutter UI scalable layout scheme.

## Solve problem

Visual designers usually output only one screen design draft when we develop mobile app, we want to be able to adapt perfectly to different resolution devices.

## Implementation scheme

Scales to the width of the screen. The most suitable UI can scroll up and down.

## How to use

### Import 

```dart
import 'package:flexible/flexible.dart';
```

### example

```dart
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