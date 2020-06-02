import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/models/menu.dart';

class MenuSpin extends StatelessWidget {
  final Menu menu;
  MenuSpin({this.menu});

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
                backgroundImage: NetworkImage(menu.menuImage),
              ),
              Text('$menu.menuName',
                  style: TextStyle(
                    color: Colors.white,
                    //fontFamily: 'Pacifico',
                    //fontSize: 40.0,
                    //fontWeight: FontWeight.bold)),
                  )),
              Text('Coins : $menu.menuPrice',
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
