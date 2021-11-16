import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lewong_q_app/models/destination.dart';
import 'package:provider/provider.dart';

class CreateDestinationScreen extends StatefulWidget {
  const CreateDestinationScreen({Key? key}) : super(key: key);

  @override
  _CreateDestinationScreenState createState() =>
      _CreateDestinationScreenState();
}

class _CreateDestinationScreenState extends State<CreateDestinationScreen> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick picture. Try Again'),
        ),
      );
    }
  }

  void submit(uid, uname, name, description, city, address, maps, image) async {
    try {
      await DestinationModel.create(
        uid,
        uname,
        image,
        name,
        description,
        city,
        address,
        maps,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Destination created'),
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
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    String uid = user!.uid;
    String uname = user.displayName!;
    TextEditingController _cityController = TextEditingController(text: '');
    TextEditingController _titleController = TextEditingController(text: '');
    TextEditingController _descController = TextEditingController(text: '');
    TextEditingController _addressController = TextEditingController(text: '');
    TextEditingController _mapsLinkController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Destination'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Place Name',
                        hintText: 'Enter destination name',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: 'City',
                        hintText: 'Enter city destination',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'Enter destination address',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _mapsLinkController,
                      decoration: InputDecoration(
                        labelText: 'Gmaps Link',
                        hintText: 'Enter destination gmaps link',
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton.icon(
                      icon: Icon(Icons.add_photo_alternate_outlined),
                      label: Text('Upload Image'),
                      onPressed: () => pickImage(),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff0369B3),
                        minimumSize: Size(346, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _descController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter destination description',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        child: Text('Create'),
                        onPressed: () {
                          submit(
                              uid,
                              uname,
                              _titleController.text,
                              _descController.text,
                              _cityController.text,
                              _addressController.text,
                              _mapsLinkController.text,
                              image);
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
      ),
    );
  }
}
