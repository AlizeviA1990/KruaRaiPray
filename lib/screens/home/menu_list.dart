import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/models/menu.dart';
import 'package:provider/provider.dart';
import 'package:kruaraipray/screens/home/menu_spin.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    final menus = Provider.of<List<Menu>>(context);

    menus.forEach((menu) {
      print(menu.menuName);
      print(menu.menuImage);
      print(menu.menuPrice);
    });

    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return MenuSpin(menu: menus[index]);
      },
    );
  }
}
