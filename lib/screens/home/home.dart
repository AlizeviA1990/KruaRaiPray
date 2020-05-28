import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/authenticate/auth_service.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('Krua-Rai-Pray'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOutAnon();
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
