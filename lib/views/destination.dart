import 'package:flutter/material.dart';

import 'package:lewong_q_app/arguments/destination-list.dart';
import 'package:lewong_q_app/models/destination.dart';
import 'package:lewong_q_app/services/auth.dart';
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
      'img': "https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg",
    },
    {
      'city': 'Jawa Timur',
      'img': "https://akcdn.detik.net.id/community/media/visual/2021/02/04/dev-tumpak-sewu-air-terjun-tirai-dari-lumajang.jpeg",
    },
    {
      'city': 'Jawa Tengah',
      'img': "https://tempatwisataseru.com/wp-content/uploads/2015/12/Objek-Wisata-Terkenal-Baturaden-di-Purwokerto.jpg",
    },
    {
      'city': 'Jawa Barat',
      'img': "https://c2.staticflickr.com/6/5703/22840840261_d00029c811_b.jpg",
    },
    {
      'city': 'Yogyakarta',
      'img': "https://cdn-image.hipwee.com/wp-content/uploads/2021/09/hipwee-Yogyakarta_Indonesia_Prambanan-temple-complex-02-360x203.jpg",
    },
    {
      'city': 'Jakarta',
      'img': "https://anekatempatwisata.com/wp-content/uploads/2021/03/Ancol-300x157.jpg",
    },
    {
      'city': 'Banten',
      'img': "https://ddalqn946qjoh.cloudfront.net/images/berita/2019/02/Sawarna_ori.jpg",
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
            onTap: () => Navigator.pushNamed(context, DESTINATION_LIST, arguments: DestinationListArguments(destination[index]['city'])),
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
                        FutureBuilder(
                          future: DestinationModel.getTotalDestination(destination[index]['city']),
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return Text(
                                snapshot.data!
                              );
                            }

                            return Text('0');
                          }
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
