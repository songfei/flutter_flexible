import 'package:flutter/material.dart';

import 'basic.dart';
import 'menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Screen Flexible Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => MenuListPage(),
        '/basic': (context) => BasicLayoutPage(),
      },
    );
  }
}
