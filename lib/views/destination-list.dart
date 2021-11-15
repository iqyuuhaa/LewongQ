import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lewong_q_app/views/destination-detail.dart';

class DestinationList extends StatelessWidget {
  const DestinationList({Key? key, required this.destination})
      : super(key: key);

  final List<Map> destination;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
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
                      colors: [
                        Color.fromRGBO(0, 17, 76, 1),
                        Colors.transparent
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(
                        Rect.fromLTRB(0, 0, retangle.width, retangle.height));
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
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return GridView.count(
            childAspectRatio: ((size.width / 2) / (size.height / 3)),
            crossAxisCount: 2,
            padding: EdgeInsets.only(top: 24, left: 20, right: 20),
            children: viewContent(context),
          );
        },
      ),
    );
  }

  viewContent(context) {
    List<Widget> listWidget = [];
    for (var i = 0; i < destination.length; i++) {
      var data = destination[i];
      listWidget.add(new GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DestinationDetail(detail: data)));
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
                  padding: EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["title"],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.bookmark))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      data["description"],
                    ),
                  ),
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
