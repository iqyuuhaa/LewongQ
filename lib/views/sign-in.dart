import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            ElevatedButton.icon(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.google),
              label: Text('Sign In with Google'),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await Auth.signInAnonymous();
              },
              icon: FaIcon(FontAwesomeIcons.question),
              label: Text('Sign In Anonymously'),
            )
          ],
        ),
      ),
    );
  }
}
