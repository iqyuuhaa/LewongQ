import 'package:flutter/material.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({ Key? key }) : super(key: key);

  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController(text: '');
    TextEditingController _emailController = TextEditingController(text: '');
    TextEditingController _phoneController = TextEditingController(text: '');
    TextEditingController _addressController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile')
      ),
      body: Container(
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
                ],
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      maxLength: 50,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                      ),
                    ),
                    TextField(
                      controller: _emailController,
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
                      keyboardType: TextInputType.number,
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
                        onPressed: () {},
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
      ),
    );
  }
}