import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kruaraipray/screens/home/localUserDataList.dart';
import 'package:kruaraipray/screens/models/localUserData.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userDataCollection =
      Firestore.instance.collection('userData');

  // collection reference
  Future updateUserData(String name, int coin, String avatarURL) async {
    return await userDataCollection.document(uid).setData({
      'name': name,
      'coin': coin,
      'avatarURL': avatarURL,
    });
  }

  // brew list from snapshot
  List<LocalUserData> _localUserDataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return LocalUserData(
          displayName: doc.data['name'] ?? '',
          coin: doc.data['coin'] ?? 0,
          avatarURL: doc.data['avatarURL'] ?? '');
    }).toList();
  }

  // get userData stream
  Stream<List<LocalUserData>> get localUserData {
    return userDataCollection.snapshots().map(_localUserDataListFromSnapshot);
  }
}
