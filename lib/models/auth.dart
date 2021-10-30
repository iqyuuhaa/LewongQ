import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Anonymous Auth Method
  static Future signInAnonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
  // /Anonymous Auth Method

  // Google Auth Method
  // static Future signInWithGoogle() async {
  //   try {
  //     AuthResult result = await _auth.sign
  //     FirebaseUser firebaseUser = result.user;

  //     return firebaseUser;
  //   } catch (e) {
  //     print(e.toString());

  //     return null;
  //   }
  // }
  // /Google Auth Method

  // Sign Out Method
  static Future<void> signOut() async {
    _auth.signOut();
  }
  // /Sign Out Method

  // static Future<User> getUser(int uid) async {
  //   String
  // }

  static Stream<FirebaseUser> get firebaseUserStream =>
      _auth.onAuthStateChanged;
}

class UninitializedUser extends Auth {}
