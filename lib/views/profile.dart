import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lewong_q_app/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: <Widget>[
                Text('Profile Screen'),
                ElevatedButton.icon(
                  onPressed: () async {
                    await Auth.signOut();
                  },
                  icon: FaIcon(FontAwesomeIcons.google),
                  label: Text('Sign Out'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
