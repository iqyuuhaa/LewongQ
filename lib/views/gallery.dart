import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:lewong_q_app/routes/routes.dart';
import 'package:lewong_q_app/models/gallery-detail.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({ Key? key }) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  Widget buildContent() => SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 35,
      ),
      child: GridView.builder(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, GALLERY_DETAIL, arguments: GalleryDetailArguments(index));
            },
            child: Hero(
              tag: index,
              child: Card(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/id/${index + 500}/1000'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                            'Gallery',
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