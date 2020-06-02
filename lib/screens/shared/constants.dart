import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Color mainBGColor = Color.fromARGB(255, 169, 56, 10);
Color bColor = Color.fromARGB(255, 231, 169, 0);
Color fColor = Color(0xffffc312);

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: Center(
        child: SpinKitChasingDots(
          color: fColor,
          size: 50.0,
        ),
      ),
    );
  }
}
