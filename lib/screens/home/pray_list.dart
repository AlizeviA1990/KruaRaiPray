import 'package:flutter/material.dart';
import 'package:kruaraipray/screens/models/pray.dart';
import 'package:provider/provider.dart';
import 'package:kruaraipray/screens/home/pray_tile.dart';

class PrayList extends StatefulWidget {
  @override
  _PrayListState createState() => _PrayListState();
}

class _PrayListState extends State<PrayList> {
  @override
  Widget build(BuildContext context) {
    final prays = Provider.of<List<Pray>>(context);
    
    return ListView.builder(
      itemCount: prays.length,
      itemBuilder: (context, index) {
        return PrayTile(pray: prays[index]);
      },
    );
  }
}
