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
  bool isLoading = false;
  File? image;
  String selectedProvince = 'Bali';

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

  void submit(uid, uname, name, province, description, city, address, maps, image) async {
    try {
      setState(() => isLoading = true);
      await DestinationModel.create(
        uid,
        uname,
        name,
        province,
        description,
        city,
        address,
        maps,
        image,
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
    setState(() => isLoading = false);
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
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedProvince,
                        hint: Text('Province'),
                        items: <String>['Bali', 'Jawa Timur', 'Jawa Tengah', 'Jawa Barat', 'Yogyakarta', 'Jakarta', 'Banten']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        onChanged: (String? value) => setState(() {
                          selectedProvince = value!;
                        }),
                      ),
                    ),
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
                    TextField(
                      controller: _descController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter destination description',
                      ),
                    ),
                    SizedBox(height: 15),
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
                        child: isLoading
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(color: Colors.white),
                              ),
                              SizedBox(width: 16),
                              Text('Please wait...'),
                            ],
                          )
                          : Text('Create')
                        ,
                        onPressed: () {
                          submit(
                            uid,
                            uname,
                            _titleController.text,
                            selectedProvince,
                            _descController.text,
                            _cityController.text,
                            _addressController.text,
                            _mapsLinkController.text,
                            image
                          );
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
