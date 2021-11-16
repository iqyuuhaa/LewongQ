import 'package:flutter/material.dart';

class CreateDestinationScreen extends StatefulWidget {
  const CreateDestinationScreen({Key? key}) : super(key: key);

  @override
  _CreateDestinationScreenState createState() =>
      _CreateDestinationScreenState();
}

class _CreateDestinationScreenState extends State<CreateDestinationScreen> {
  TextEditingController _cityController = TextEditingController(text: '');
  TextEditingController _titleController = TextEditingController(text: '');
  TextEditingController _descController = TextEditingController(text: '');
  TextEditingController _addressController = TextEditingController(text: '');
  TextEditingController _mapsLinkController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
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
