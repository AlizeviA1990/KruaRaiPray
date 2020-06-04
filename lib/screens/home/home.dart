import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/authenticate/auth_service.dart';
import 'package:kruaraipray/screens/home/pray_list.dart';
import 'package:kruaraipray/screens/models/pray.dart';
import 'package:kruaraipray/screens/models/user.dart';
import 'package:kruaraipray/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:kruaraipray/screens/shared/constants.dart';

class HomePage extends StatefulWidget {
  final User localUser;
  HomePage({Key key, @required this.localUser}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Pray>>.value(
      value: DatabaseService().localUserData,
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
        body: PrayList(),
      ),
    );
  }
}
