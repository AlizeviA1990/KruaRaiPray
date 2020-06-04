import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kruaraipray/screens/models/pray.dart';
import 'package:kruaraipray/screens/models/user.dart';

class DatabaseService {
  final String uid;
  final User localUser;
  DatabaseService({this.uid, this.localUser});

  final CollectionReference prayCollection =
      Firestore.instance.collection('userData');

  // collection reference
  Future updateUserData(String name, int coin, String avatarURL) async {
    return await prayCollection.document(uid).setData(
        {'name': name, 'coin': coin, 'avatarURL': avatarURL, 'uid': uid});
  }

  // pray list from snapshot
  List<Pray> _prayListFromSnapshot(QuerySnapshot snapshot) {
    List<Pray> a = snapshot.documents.map((doc) {
      Pray(
          uid: doc.data['uid'] ?? '',
          displayName: doc.data['name'] ?? '',
          coin: doc.data['coin'] ?? 0,
          avatarURL: doc.data['avatarURL'] ?? '');
    }).toList();
    List<Pray> ansPray = List<Pray>();
    for (int i = 0; i < a.length; i++) {
      if (a[i].uid == uid) {
        ansPray.add(a[i]);
      }
    }
    return ansPray;
  }

  // get userData stream
  Stream<List<Pray>> get localUserData {
    return prayCollection.snapshots().map(_prayListFromSnapshot);
  }
}
