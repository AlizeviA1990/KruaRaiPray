import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'dart:async';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:kruaraipray/screens/authenticate/auth_service.dart';
import 'package:kruaraipray/screens/shared/loading.dart';

class AuthenticatePage extends StatefulWidget {
  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  // global state
  bool loadingState = false;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/splash_screen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                loadingState
                    ? CircularProgressIndicator()
                    : Container(
                        child: Text('loading State: $loadingState'),
                      ),
                ClipOval(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/facebook_login_btn.png"),
                      ),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () async {
                        setState(() {
                          loadingState = true;
                          print('loading------ $loadingState');
                        });

                        dynamic result = await _auth.loginWithFB();
                        if (result == null) {
                          if (this.mounted) {
                            setState(() {
                              loadingState = true;
                            });
                          }

                          print('null result from facebook.');
                        } else {
                          if (this.mounted) {
                            setState(() {
                              loadingState = true;
                            });
                          }

                          print('>\n>\n>\n');
                          print('signed in');
                          print(result.uid);
                        }
                      },
                      child: Container(),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text('Skip log-in'),
                  onPressed: () {
                    setState(() {
                      loadingState = true;
                      print(
                          '------------------------------> loadingState: $loadingState');
                    });
                  },
                  // onPressed: () async {
                  //   dynamic result = await _auth.signInAnon();
                  //   if (result == null) {
                  //     print('error signing in');
                  //   } else {
                  //     print('>\n>\n>\n');
                  //     print('signed in');
                  //     print(result.uid);
                  //   }
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // throw UnimplementedError();
  }
}
