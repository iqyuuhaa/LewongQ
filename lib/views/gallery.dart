import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'gallery-detail.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> imageList = <String>[
    "http://i.imgur.com/zuG2bGQ.jpg",
    "http://i.imgur.com/ovr0NAF.jpg",
    "http://i.imgur.com/pSHXfu5.jpg",
    "http://i.imgur.com/3wQcZeY.jpg",
    "http://i.imgur.com/pSHXfu5.jpg",
    "http://i.imgur.com/3wQcZeY.jpg",
    "http://i.imgur.com/zuG2bGQ.jpg",
    "http://i.imgur.com/ovr0NAF.jpg",
    "http://i.imgur.com/pSHXfu5.jpg",
    "http://i.imgur.com/3wQcZeY.jpg",
    "http://i.imgur.com/pSHXfu5.jpg",
    "http://i.imgur.com/3wQcZeY.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return GridView.count(
            crossAxisCount: 2,
            children: viewContent(),
          );
        },
      ),
    );
  }

  viewContent() {
    List<Widget> listWidget = [];
    for (var i = 0; i < imageList.length; i++) {
      listWidget.add(new Container(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GalleryDetailScreen(image: imageList[i])));
              },
              child: Image.network(
                imageList[i],
                width: 165,
                height: 165,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ));
    }
    return listWidget;
  }
}
