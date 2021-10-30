import 'package:flutter/material.dart';

import 'package:lewong_q_app/models/auth.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign In with Google'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Auth.signInAnonymous();
              },
              child: Text('Sign In Anonymous'),
            ),
          ],
        ),
      ),
    );
  }
}
