import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lewong_q_app/views/destination-list.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  final List<Map<dynamic, dynamic>> destination = <Map<dynamic, dynamic>>[
    {
      'city': 'Bali',
      'total_destination': '12',
      'img': "http://i.imgur.com/zuG2bGQ.jpg",
      'destination': [
        {
          'title': 'Kuta',
          'description': 'Pantai',
          'address': 'Jl. Kuta',
          'maps': 'https://goo.gl/maps/Vrwp5bKt9JnGhiF3A',
          'bookmark': false
        },
        {
          'title': 'Kuta',
          'description': 'Pantai',
          'address': 'Jl. Kuta',
          'maps': 'https://goo.gl/maps/Vrwp5bKt9JnGhiF3A',
          'bookmark': false
        },
      ]
    },
    {
      'city': 'Jawa Timur',
      'total_destination': '10',
      'img': "http://i.imgur.com/zuG2bGQ.jpg",
      'destination': [
        {
          'title': 'Kuta',
          'description': 'Pantai',
          'address': 'Jl. Kuta',
          'maps': 'https://goo.gl/maps/Vrwp5bKt9JnGhiF3A',
          'bookmark': false
        },
        {
          'title': 'Kuta',
          'description': 'Pantai',
          'address': 'Jl. Kuta',
          'maps': 'https://goo.gl/maps/Vrwp5bKt9JnGhiF3A',
          'bookmark': false
        },
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.only(top: 24, left: 20, right: 20),
            child: GridView.count(
              childAspectRatio: ((size.width / 2) / (size.height / 3)),
              crossAxisCount: 2,
              children: viewContent(),
            ),
          );
        },
      ),
    );
  }

  viewContent() {
    List<Widget> listWidget = [];
    for (var i = 0; i < destination.length; i++) {
      var data = destination[i];
      listWidget.add(new GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DestinationList(destination: data['destination'])));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network("http://i.imgur.com/zuG2bGQ.jpg",
                        fit: BoxFit.fill, height: 142, width: 142)),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data["city"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Row(children: [
                    Text(
                      data["total_destination"],
                    ),
                    Text(
                      ' Destination',
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return listWidget;
  }
}
