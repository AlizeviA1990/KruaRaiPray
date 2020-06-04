import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kruaraipray/screens/models/pray.dart';
import 'package:kruaraipray/screens/models/user.dart';
import 'package:kruaraipray/staticVar.dart';

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

  void getData() {
    prayCollection.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        if (f.data['uid']() == uid) {
          staticVar.localUser = User(
              uid: f.data['uid'],
              avatarURL: f.data['avatarURL'],
              displayName: f.data['name'],
              coin: f.data['coin']);
        }
        print('.................> ${f.data}}');
      });
    });
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

    for (int i = 0; i < a.length; i++) {
      if (a[i].uid == uid) {
        staticVar.localUser = User(
          uid: a[i].uid,
          displayName: a[i].displayName,
          coin: a[i].coin,
          avatarURL: a[i].avatarURL,
        );
      }
    }
    return a;
  }

  // get userData stream
  Stream<List<Pray>> get localUserData {
    getData();
    return prayCollection.snapshots().map(_prayListFromSnapshot);
  }
}
