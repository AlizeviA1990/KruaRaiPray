import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/models/pray.dart';

class PrayTile extends StatelessWidget {
  final Pray pray;
  PrayTile({this.pray});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(pray.avatarURL),
              ),
              Text('$pray.displayName',
                  style: TextStyle(
                    color: Colors.white,
                    //fontFamily: 'Pacifico',
                    //fontSize: 40.0,
                    //fontWeight: FontWeight.bold)),
                  )),
              Text('Coins : $pray.coin',
                  style: TextStyle(
                    color: Colors.white,
                    //fontFamily: 'Pacifico',
                    //fontSize: 40.0,
                    //fontWeight: FontWeight.bold)),
                  )),
            ]),
      ),
    );
  }
}
