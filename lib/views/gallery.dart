import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({ Key? key }) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: <Widget>[
                Text('Gallery Screen'),
              ],
            ),
          );
        },
      ),
    );
  }
}