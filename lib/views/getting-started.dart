import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:lewong_q_app/routes/routes.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 74),
                  child: new Image.asset('assets/images/forest.png'),
                ),
                Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Discover new historical place",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    child: Text('Getting Started'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, WRAPPER);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0369B3),
                      minimumSize: Size(346, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
