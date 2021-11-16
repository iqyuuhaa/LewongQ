import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lewong_q_app/arguments/destination-detail.dart';
import 'package:lewong_q_app/routes/routes.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final List<Map<dynamic, dynamic>> destination = <Map<dynamic, dynamic>>[
    {
      'title': 'Kuta',
      'description': 'Pantai',
      'address': 'Jl. Kuta',
      'img':
          "https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg",
      'maps': 'https://goo.gl/maps/Vrwp5bKt9JnGhiF3A',
      'bookmark': true
    },
    {
      'title': 'Kuta',
      'description': 'Pantai',
      'address': 'Jl. Kuta',
      'img':
          "https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg",
      'maps': 'https://goo.gl/maps/Vrwp5bKt9JnGhiF3A',
      'bookmark': true
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: destination.length,
        primary: false,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 14,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return Hero(
            tag: index,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                DESTINATION_DETAIL,
                arguments: DestinationDetailArguments(index),
              ),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            destination[index]['img'],
                            fit: BoxFit.fill,
                            width: 142,
                            height: 142,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  destination[index]["title"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidBookmark,
                                    color: Color(0xff3f85d3),
                                    size: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              destination[index]['description'],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
