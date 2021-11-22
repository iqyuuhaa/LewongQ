import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lewong_q_app/arguments/destination-detail.dart';
import 'package:lewong_q_app/models/bookmark.dart';
import 'package:lewong_q_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    String uid = user!.uid;
    String uname = user.displayName!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: BookmarkModel.getUserList(uid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: snapshot.data!.size,
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 14,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
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
                            data["maps"]),
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
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            BookmarkModel.delete(
                                                snapshot.data!.docs[index].id);
                                          },
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
                                      data['description'],
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
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
