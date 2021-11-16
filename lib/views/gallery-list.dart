import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:lewong_q_app/models/gallery.dart';
import 'package:lewong_q_app/routes/routes.dart';

class GalleryListScreen extends StatefulWidget {
  const GalleryListScreen({ Key? key }) : super(key: key);

  @override
  _GalleryListScreenState createState() => _GalleryListScreenState();
}

class _GalleryListScreenState extends State<GalleryListScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('List Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.post_add_outlined),
            onPressed: () => Navigator.pushNamed(
              context,
              CREATE_GALLERY,
            ),
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<QuerySnapshot<Object?>>(
          future: GalleryModel.getUserList(user!.uid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.size,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(data['picture']),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )
                                ),
                                Text(
                                  data['description'],
                                  style: TextStyle(
                                    fontSize: 12,
                                  )
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () => GalleryModel.delete(snapshot.data!.docs[index].id),
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}