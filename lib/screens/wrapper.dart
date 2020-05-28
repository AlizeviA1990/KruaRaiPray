import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/authenticate/authenticate.dart';
import 'package:kruaraipray/screens/home/home.dart';
import 'package:kruaraipray/screens/models/user.dart';
import 'package:provider/provider.dart';

class WrapperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either Home or Authenticate widget
    final user = Provider.of<User>(context);

    if (user == null) {
      return AuthenticatePage();
    } else {
      return HomePage();
    }
  }
}
