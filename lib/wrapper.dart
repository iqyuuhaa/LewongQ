import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:lewong_q_app/views/sign-in.dart';
import 'package:lewong_q_app/views/index.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return user == null ? SignInScreen() : IndexScreen();
  }
}
