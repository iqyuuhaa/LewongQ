import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lewong_q_app/models/auth.dart';

class HomeScreen extends StatelessWidget {
  final UserCredential user;

  HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Index Page'),
        ),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return Center(
              child: Container(
                child: Text(user.toString()),
              ),
            );
          },
        ),);
  }
}
