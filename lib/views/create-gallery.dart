import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lewong_q_app/routes/routes.dart';
import 'package:lewong_q_app/models/gallery.dart';

class CreateGalleryScreen extends StatefulWidget {
  const CreateGalleryScreen({ Key? key }) : super(key: key);

  @override
  _CreateGalleryScreenState createState() => _CreateGalleryScreenState();
}

class _CreateGalleryScreenState extends State<CreateGalleryScreen> {
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

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    String uid = user!.uid;
    String uname = user.displayName!;
    TextEditingController _nameController = TextEditingController(text: '');
    TextEditingController _descriptionController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Gallery')
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              image != null
                ? Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Image.file(
                    image!,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )
                : Container(),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      maxLength: 50,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter gallery name',
                      ),
                    ),
                    TextField(
                      maxLength: 100,
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter gallery description',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton.icon(
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.5),
                      child: ElevatedButton(
                        child: Text('Create'),
                        onPressed: () async {
                          try {
                            await GalleryModel.create(
                              uid,
                              uname,
                              image,
                              _nameController.text,
                              _descriptionController.text,
                            );
                            Navigator.pushNamed(context, GALLERY_LIST);
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Gallery created'),
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
                    ),
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