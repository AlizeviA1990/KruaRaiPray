import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:kruaraipray/screens/authenticate/auth_service.dart';
import 'package:kruaraipray/screens/home/menu_spin.dart';
import 'package:kruaraipray/screens/models/menu.dart';
import 'package:kruaraipray/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:kruaraipray/screens/shared/constants.dart';
import 'package:kruaraipray/screens/home/pray_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Menu>>.value(
      value: DatabaseService().localMenuData,
      child: Scaffold(
        backgroundColor: fColor,
        appBar: AppBar(
            title: Text('Krua Rai Pray'),
            backgroundColor: bColor,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ]),
        body: MenuSpin(),
      ),
    );
  }
}
