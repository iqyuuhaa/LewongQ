import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lewong_q_app/models/auth.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser user;

  HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(user.uid),
            ElevatedButton(
              onPressed: () async {
                await Auth.signOut();
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
