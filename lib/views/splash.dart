import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lewong_q_app/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer = Timer(const Duration(seconds: 5), () {});

  @override
  void initState() {
    super.initState();

    timer = new Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, GETTING_STARTED, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3f85d3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Image.asset('assets/logo.png'),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
    );
  }
}
