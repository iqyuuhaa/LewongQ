import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:lewong_q_app/routes/routes.dart';

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
      'img': "https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg",
      'destination': [
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
      'img': "https://akcdn.detik.net.id/community/media/visual/2021/02/04/dev-tumpak-sewu-air-terjun-tirai-dari-lumajang.jpeg",
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
      'city': 'Jawa Tengah',
      'total_destination': '2',
      'img': "https://tempatwisataseru.com/wp-content/uploads/2015/12/Objek-Wisata-Terkenal-Baturaden-di-Purwokerto.jpg",
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
      'city': 'Jawa Barat',
      'total_destination': '1',
      'img': "https://c2.staticflickr.com/6/5703/22840840261_d00029c811_b.jpg",
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

  Widget buildContent() => SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.only(
        bottom: 35,
      ),
      child: GridView.builder(
        itemCount: destination.length,
        primary: false,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 10,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, DESTINATION_LIST),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        destination[index]['img'],
                        fit: BoxFit.fill,
                        height: 142,
                        width: 142,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 8,
                        right: 8,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          destination[index]['city'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(children: [
                        Text(
                          destination[index]['total_destination'],
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
          );
        }
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
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
                  ),
                ),
                flexibleSpace: Stack(
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
                            'Destination',
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
