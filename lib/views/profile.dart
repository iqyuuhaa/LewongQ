import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:lewong_q_app/services/auth.dart';
import 'package:lewong_q_app/routes/routes.dart';

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
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 80,
                        bottom: 15,
                      ),
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 77, 147, 1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Dummy User1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'user@gmail.com',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, CHANGE_PROFILE),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        height: 45,
                        margin: EdgeInsets.only(top: 40),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(223, 241, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.edit),
                              SizedBox(width: 12.5),
                              Text('Change Profile'),
                              Spacer(),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        height: 45,
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(223, 241, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(width: 12.5),
                              Text('Upload Destinaton'),
                              Spacer(),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        height: 45,
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(223, 241, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add_photo_alternate),
                              SizedBox(width: 12.5),
                              Text('Upload Gallery'),
                              Spacer(),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        height: 45,
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(223, 241, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.folder_special),
                              SizedBox(width: 12.5),
                              Text('Bookmark'),
                              Spacer(),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async => await Auth.signOut(),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        height: 45,
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(223, 241, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.logout),
                              SizedBox(width: 12.5),
                              Text('Logout'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
