import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

import 'package:lewong_q_app/models/user.dart';

class AuthService {
  static auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();

  User? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }

    return User(user.uid, user.email);
  }

  Stream<User?>? get user {}
  Future<User?> signInWithGoogle
}