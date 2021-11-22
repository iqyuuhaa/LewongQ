import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:lewong_q_app/models/users.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({ Key? key }) : super(key: key);

  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile')
      ),
      body: FutureBuilder(
        future: UsersModel.getData(user!.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            TextEditingController _nameController = TextEditingController(text: user.displayName ?? '');
            TextEditingController _emailController = TextEditingController(text: user.email ?? '');
            TextEditingController _phoneController = TextEditingController(text: user.phoneNumber ?? '');
            TextEditingController _addressController = TextEditingController(text: '');

            if (snapshot.data!.data() != null) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

              _nameController.text = data['name'];
              _emailController.text = data['email'];
              _phoneController.text = data['phone'];
              _addressController.text = data['address'];
            }

            return Container(
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 30,
                            bottom: 15,
                          ),
                          child: Stack(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: user.photoURL == ''
                                  ? AssetImage('assets/images/user.png') as ImageProvider
                                  : NetworkImage(user.photoURL!),
                              ),
                              // Align(
                              //   alignment: Alignment.bottomRight,
                              //   child: Container(
                              //     width: 25,
                              //     height: 25,
                              //     decoration: BoxDecoration(
                              //       color: Color.fromRGBO(0, 77, 147, 1),
                              //       shape: BoxShape.circle,
                              //     ),
                              //     child: Icon(
                              //       Icons.edit,
                              //       color: Colors.white,
                              //       size: 12,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _nameController,
                            enabled: _nameController.text == ''
                              ? true
                              : false,
                            maxLength: 50,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              hintText: 'Enter your name',
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            enabled: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email address',
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            maxLength: 12,
                            keyboardType: TextInputType.number,
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              hintText: 'Enter your phone number',
                              prefix: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text('+62'),
                              ),
                            ),
                          ),
                          TextField(
                            maxLength: 100,
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              hintText: 'Enter your address',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                              child: Text('Edit'),
                              onPressed: () async {
                                setState(() {});
                                try {
                                  await UsersModel.createOrUpdate(
                                    user.uid,
                                    _nameController.text,
                                    _emailController.text,
                                    _phoneController.text,
                                    _addressController.text,
                                  );

                                  FocusScope.of(context).unfocus();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Profile updated'),
                                    ),
                                  );
                                } catch (e) {
                                  FocusScope.of(context).unfocus();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Something wrong! Try Again'),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff0369B3),
                                minimumSize: Size(346, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}