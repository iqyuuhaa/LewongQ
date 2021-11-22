import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lewong_q_app/models/destination.dart';
import 'package:lewong_q_app/models/gallery.dart';

import 'package:lewong_q_app/services/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> destinationList = <String>[
    "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
    "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg",
    "https://cdn.pixabay.com/photo/2014/02/27/16/10/tree-276014__340.jpg",
    "https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297__340.jpg",
  ];

  final List<String> eventList = <String>[
    "https://cdn.pixabay.com/photo/2017/07/21/23/57/concert-2527495__480.jpg",
    "https://cdn.pixabay.com/photo/2020/01/15/17/38/fireworks-4768501__340.jpg",
    "https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/23/17/56/beach-1854076__340.jpg",
  ];

  final List<String> galleryList = <String>[
    "https://cdn.pixabay.com/photo/2017/02/08/17/24/fantasy-2049567__340.jpg",
    "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__340.jpg",
    "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__340.jpg",
    "https://cdn.pixabay.com/photo/2013/10/02/23/03/mountains-190055__340.jpg",
  ];

  Widget buildContent() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 35,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Our Destination',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                ),
                FutureBuilder<QuerySnapshot<Object?>>(
                    future: DestinationModel.getAll(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        int _dataLength = 0;

                        _dataLength = snapshot.data!.docs.length > 4
                         ? 4
                         : snapshot.data!.docs.length;

                        List<Map<String, dynamic>> data = [];

                        for (var i = 0; i < _dataLength; i++) {
                          data.add(snapshot.data!.docs[i].data());
                        }

                        return CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            aspectRatio: 2.0,
                          ),
                          items: data
                              .map((e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Image.network(
                                          e['picture'],
                                          width: 1000,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(200, 0, 0, 0),
                                                  Color.fromARGB(0, 0, 0, 0),
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 20.0,
                                            ),
                                            child: Text(
                                              e['name'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            color: Color.fromRGBO(223, 241, 255, 1),
            child: Align(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Event',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Let's follow the \nevent in a variety of \nhistoric sites.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 0),
                      children: <Widget>[
                        FutureBuilder<QuerySnapshot<Object?>>(
                            future: DestinationModel.getAll(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.done) {
                                int _dataLength = 0;

                                _dataLength = snapshot.data!.docs.length > 4
                                  ? 4
                                  : snapshot.data!.docs.length;

                                List<Map<String, dynamic>> data = [];

                                for (var i = 0; i < _dataLength; i++) {
                                  data.add(snapshot.data!.docs[i].data());
                                }
                                return CarouselSlider(
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    enableInfiniteScroll: false,
                                    autoPlay: false,
                                    aspectRatio: 2.0,
                                  ),
                                  items: data
                                      .map((e) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: <Widget>[
                                                Image.network(
                                                  e['picture'],
                                                  width: 1000,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                  bottom: 0.0,
                                                  left: 0.0,
                                                  right: 0.0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(
                                                              200, 0, 0, 0),
                                                          Color.fromARGB(
                                                              0, 0, 0, 0),
                                                        ],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                      ),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 20.0,
                                                    ),
                                                    child: Text(
                                                      e['name'],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 95,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                ),
                FutureBuilder<QuerySnapshot<Object?>>(
                    future: GalleryModel.getAll(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        int _dataLength = 0;

                        _dataLength = snapshot.data!.docs.length > 4
                         ? 4
                         : snapshot.data!.docs.length;

                        List<Map<String, dynamic>> data = [];

                        for (var i = 0; i < _dataLength; i++) {
                          data.add(snapshot.data!.docs[i].data());
                        }
                        return CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            aspectRatio: 2.0,
                          ),
                          items: data
                              .map((e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Image.network(
                                          e['picture'],
                                          width: 1000,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(200, 0, 0, 0),
                                                  Color.fromARGB(0, 0, 0, 0),
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 20.0,
                                            ),
                                            child: Text(
                                              e['name'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: StreamBuilder(
        stream: Auth.getStreamUser,
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 200,
                backgroundColor: Color.fromRGBO(0, 17, 76, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                flexibleSpace: Stack(
                  children: <Widget>[
                    ShaderMask(
                      blendMode: BlendMode.dstIn,
                      shaderCallback: (retangle) {
                        return LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 17, 76, 1),
                            Colors.transparent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(Rect.fromLTRB(
                            0, 0, retangle.width, retangle.height));
                      },
                      child: FlexibleSpaceBar(
                        background: Image.asset(
                          'assets/images/app-bar-cover.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Discover',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              buildContent(),
            ],
          );
        },
      ),
    );
  }
}
