import 'package:flutter/material.dart';

class DestinationDetail extends StatefulWidget {
  const DestinationDetail({Key? key, required this.detail}) : super(key: key);

  final Map<dynamic, dynamic> detail;
  @override
  _DestinationDetailState createState() => _DestinationDetailState();
}

class _DestinationDetailState extends State<DestinationDetail> {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> data = widget.detail;
    String title = data["title"];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
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
                        title,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Text('tes'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
