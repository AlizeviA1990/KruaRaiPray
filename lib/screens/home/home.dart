import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:kruaraipray/screens/models/localUserData.dart';
import 'package:kruaraipray/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:kruaraipray/screens/home/localUserDataList.dart';

//Color mainBGColor = Color.fromARGB(255, 169, 56, 10);
Color _bColor = Color.fromARGB(255, 231, 169, 0);
Color _fColor = Color(0xffffc312);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LocalUserData>>.value(
      value: DatabaseService().localUserData,
      child: Scaffold(
        backgroundColor: _fColor,
        body: Stack(
          children: <Widget>[],
        ),
      ),
    );
  }
}
