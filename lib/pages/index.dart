import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class IndexPage extends StatelessWidget {
  final FirebaseUser user;
  IndexPage(this.user);

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
            RaisedButton(
              onPressed: () async {
                await AuthService.signOut();
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
