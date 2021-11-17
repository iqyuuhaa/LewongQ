import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

import 'package:lewong_q_app/models/gallery.dart';
import 'package:lewong_q_app/services/auth.dart';
import 'package:lewong_q_app/routes/routes.dart';
import 'package:lewong_q_app/arguments/gallery-detail.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({ Key? key }) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    // User? user = Provider.of<User?>(context);

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
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 35,
                  ),
                  child: FutureBuilder<QuerySnapshot<Object?>>(
                    future: GalleryModel.getAll(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return GridView.builder(
                          itemCount: snapshot.data.size,
                          primary: false,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(context, GALLERY_DETAIL, arguments: GalleryDetailArguments(index, data['uname'], data['picture'], data['name'], data['description'])),
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
                                        image: NetworkImage(data['picture']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}