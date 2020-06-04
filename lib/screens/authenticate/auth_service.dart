import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:kruaraipray/screens/models/user.dart';
import 'package:kruaraipray/screens/services/database.dart';
import 'package:kruaraipray/staticVar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  ///--------------------------------------------------------------------------

  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      User(uid: user.uid);
      return User(uid: user.uid);
    } else {
      return null;
    }
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  ///----------------------------------------------------------------------------

  Future<User> loginWithFB() async {
    final fbLoginVar = FacebookLogin();
    final result = await fbLoginVar.logIn(['email']);
    try {
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          AuthResult result_1 = await _auth.signInWithCredential(
              FacebookAuthProvider.getCredential(
                  accessToken: result.accessToken.token));

          FirebaseUser user = result_1.user;

          // create a new document for the user with the uid
          await DatabaseService(uid: user.uid).updateUserData(
            user.displayName,
            0,
            user.photoUrl,
          );
          return _userFromFirebaseUser(user);
          break;
        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Future<FirebaseUser> logOutWithFacebook() async {
  //   await _auth_facebookSignIn.logOut();
  //   print('Logged out.>>>>>>>>>>>>>');
  // }
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void getDocumentData() async {
    return DatabaseService(uid: staticVar.localUser.uid).getData();
  }
}
