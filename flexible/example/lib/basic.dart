import 'package:flexible/flexible.dart';
import 'package:flutter/material.dart';

class BasicLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenFlexibleWidget(
      // 1. Wrap with `ScreenFlexibleWidget`
      child: Builder(
        builder: (BuildContext context) {
          return Container(
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: flexible(context, 187.5), // 2. All pixel value use `flexible` function , 375.0/2=187.5,
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
  }
}
