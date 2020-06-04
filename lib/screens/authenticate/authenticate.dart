import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'dart:async';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:kruaraipray/screens/authenticate/auth_service.dart';
import 'package:kruaraipray/screens/shared/constants.dart';

class AuthenticatePage extends StatefulWidget {
  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  bool isLoading = false;
  dynamic result;

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return MaterialApp(
      home: isLoading
          ? Loading()
          : Scaffold(
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
                      ClipOval(
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("images/facebook_login_btn.png"),
                            ),
                          ),
                          child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () async {
                              if (this.mounted) {
                                setState(() {
                                  isLoading = true;
                                });
                              }
                              result = await _auth.loginWithFB();

                              if (result == null) {
                                if (this.mounted) {
                                  setState(() {
                                    isLoading = false;
                                    print('null result from facebook.');
                                  });
                                }
                              } else {
                                if (this.mounted) {
                                  setState(() {
                                    isLoading = false;
                                    print('>\n>\n>\n');
                                    print('signed in');
                                    print(result.uid);
                                  });
                                }
                              }
                            },
                            child: null,
                          ),
                        ),
                      ),
                      //RaisedButton(
                      //  child: Text('Skip log-in'),
                      //  onPressed: () {},
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
                      //),
                    ],
                  ),
                ),
              ),
            ),
    );

    throw UnimplementedError();
  }
}
