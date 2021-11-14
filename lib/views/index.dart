import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:lewong_q_app/views/home.dart';
import 'package:lewong_q_app/views/destination.dart';
import 'package:lewong_q_app/views/gallery.dart';
import 'package:lewong_q_app/views/profile.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({ Key? key }) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = <Widget>[
    HomeScreen(),
    DestinationScreen(),
    GalleryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.map, size: 30),
      Icon(Icons.camera, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: index == 0
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )
              : BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
          ),
          flexibleSpace: ClipRRect(
            child: Stack(
              children: <Widget>[
                ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (retangle) {
                    return LinearGradient(
                      colors: [Color.fromRGBO(0, 17, 76, 1), Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(Rect.fromLTRB(0, 0, retangle.width, retangle.height));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/app-bar-cover.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Bali',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Color(0xff3f85d3),
          backgroundColor: Colors.transparent,
          height: 60,
          index: index,
          items: items,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) => setState(() {
              this.index = index;
          }),
        ),
      ),
    );
  }
}