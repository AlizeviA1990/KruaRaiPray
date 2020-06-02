import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kruaraipray/screens/models/menu.dart';
import 'package:kruaraipray/screens/models/pray.dart';
import 'package:kruaraipray/screens/models/menu.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference prayCollection =
      Firestore.instance.collection('userData');

  final CollectionReference menuCollection =
      Firestore.instance.collection('menuData');

  // collection reference
  Future updateUserData(String name, int coin, String avatarURL) async {
    return await prayCollection
        .document(uid)
        .setData({'name': name, 'coin': coin, 'avatarURL': avatarURL});
  }

  // pray list from snapshot
  List<Pray> _prayListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Pray(
          displayName: doc.data['name'] ?? '',
          coin: doc.data['coin'] ?? 0,
          avatarURL: doc.data['avatarURL'] ?? '');
    }).toList();
  }

  // menu list from snapshot
  List<Menu> _menuListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Menu(
          menuName: doc.data['menuName'] ?? '',
          menuImage: doc.data['menuImage'] ?? '',
          menuPrice: doc.data['menuPrice'] ?? 0);
    }).toList();
  }

  // get userData stream
  Stream<List<Pray>> get localUserData {
    return prayCollection.snapshots().map(_prayListFromSnapshot);
  }

  // get userData stream
  Stream<List<Menu>> get localMenuData {
    return menuCollection.snapshots().map(_menuListFromSnapshot);
  }
}
