
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lewong_q_app/services/auth.dart';
import 'package:lewong_q_app/arguments/destination-detail.dart';
import 'package:lewong_q_app/models/bookmark.dart';
import 'package:lewong_q_app/models/destination.dart';
import 'package:lewong_q_app/routes/routes.dart';

class DestinationListScreen extends StatelessWidget {
  const DestinationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    String uid = user!.uid;
    String uname = user.displayName!;

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
                            'Bali',
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
                child: FutureBuilder<QuerySnapshot<Object?>>(
                  future: DestinationModel.getAll(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 35,
                        ),
                        child: GridView.builder(
                          itemCount: snapshot.data.size,
                          primary: false,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 9 / 14,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> data = snapshot.data!.docs[index]
                                .data() as Map<String, dynamic>;
                            return Hero(
                              tag: index,
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  DESTINATION_DETAIL,
                                  arguments: DestinationDetailArguments(
                                    index,
                                    uname,
                                    data["description"],
                                    data["name"],
                                    data["picture"],
                                    data["address"],
                                    data["city"],
                                    data["maps"]
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Image.network(
                                              data['picture'],
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    data["name"],
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () async {
                                                      try {
                                                        await BookmarkModel.create(
                                                          uid,
                                                          uname,
                                                          data["picture"],
                                                          data["name"],
                                                          data["description"],
                                                        );
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text('Destination saved'),
                                                          ),
                                                        );
                                                      } catch (e) {
                                                        print(e.toString());
                                                        FocusScope.of(context).unfocus();
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text('Something wrong! Try Again'),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.bookmark,
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
                                                data["description"],
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

                    return Center(child: CircularProgressIndicator());
                  }
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
