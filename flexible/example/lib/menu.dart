import 'package:flutter/material.dart';

class MenuListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Function> menus = {
      '基本布局 (Basic Layout)': () {
        Navigator.pushNamed(context, '/basic');
      },
      '两边留白 (Basic Layout)': () {
        print('ok');
      },
      '两边留白有溢出 (Basic Layout)': () {
        print('ok');
      },
    };

    List<Widget> items = [];
    for (var title in menus.keys) {
      items.add(
        GestureDetector(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          onTap: menus[title],
        ),
      );

      items.add(Divider(
        color: Colors.grey,
        height: 1.0,
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text('主菜单')),
      body: ListView(
        children: items,
      ),
    );
  }
}
