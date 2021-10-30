import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:lewong_q_app/views/sign-in.dart';
import 'package:lewong_q_app/views/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    return firebaseUser == null
        ? SignInScreen()
        : HomeScreen(firebaseUser);
  }
}
