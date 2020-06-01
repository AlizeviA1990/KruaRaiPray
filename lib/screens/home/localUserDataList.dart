import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kruaraipray/screens/models/localUserData.dart';
import 'package:kruaraipray/screens/authenticate/auth_service.dart';

class LocalUserList extends StatefulWidget {
  @override
  _LocalUserListState createState() => _LocalUserListState();
}

class _LocalUserListState extends State<LocalUserList> {
  @override
  Widget build(BuildContext context) {
    final localUserDataList = Provider.of<List<LocalUserData>>(context);
    localUserDataList.forEach((userObject) {
      print(userObject.displayName);
      print("..............................");
    });
  }
}
