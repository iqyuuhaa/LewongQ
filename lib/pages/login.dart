import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'index.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await AuthService.signInAnonymous();
          },
          child: Text('Sign In Anonymous'),
        ),
      ),
    );
  }
}
