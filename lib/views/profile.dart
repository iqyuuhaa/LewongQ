import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:lewong_q_app/services/auth.dart';
import 'package:lewong_q_app/routes/routes.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: Auth.getStreamUser,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 80,
                        bottom: 15,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: user!.isAnonymous
                          ? AssetImage('assets/images/user.png') as ImageProvider
                          : NetworkImage(user.photoURL!),
                      ),
                    ),
                    Text(
                      user.isAnonymous
                        ? 'Guest'
                        : user.displayName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      user.isAnonymous
                        ? 'No Email'
                        : user.email!,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Visibility(
                      visible: !user.isAnonymous,
                      child: GestureDetector(
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
                    ),
                    Visibility(
                      visible: !user.isAnonymous,
                      child: GestureDetector(
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
                    ),
                    Visibility(
                      visible: !user.isAnonymous,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, GALLERY_LIST),
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
                                Text('List Gallery'),
                                Spacer(),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !user.isAnonymous,
                      child: GestureDetector(
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
