import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({ Key? key }) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: <Widget>[
                Text('Destination Screen'),
              ],
            ),
          );
        },
      ),
    );
  }
}