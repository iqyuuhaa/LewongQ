import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();

  // Anonymous Auth Method
  static Future signInAnonymous() async {
    try {
      await _auth.signInAnonymously();

    } catch (e) {
      print(e.toString());

      return null;
    }
  }
  // /Anonymous Auth Method

  // Google Auth Method
  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
  // /Google Auth Method

  // Phone Number Auth Method
  static Future verifyPhone(String phone) async {
    String verificationCode = '';

    while (verificationCode == '') {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+62' + phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCode = verificationId;
        },
        timeout: Duration(seconds: 60)
      );
    }

    if (verificationCode != '') {
      return verificationCode;
    }
  }

  static Future signInWithPhoneNumber(String verificationCode, String pin) async {
    try {
      print('verificationCode = ' + verificationCode + ' pin = ' + pin);

      await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationCode, smsCode: pin));

    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
  // /Phone Number Auth Method


  // Sign Out Method
  static Future<void> signOut() async {
    _googleSignIn.signOut();
    _auth.signOut();
  }
  // /Sign Out Method
}

class UninitializedAuth extends Auth {}
