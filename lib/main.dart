import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:kruaraipray/screens/models/user.dart';
import 'package:kruaraipray/screens/authenticate/auth_service.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: WrapperPage(),
      ),
    );
  }
}
