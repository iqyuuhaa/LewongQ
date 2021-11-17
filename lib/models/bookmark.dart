import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarkModel {
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('bookmark');

  static Future<void> create(String uid, String uname, String imageFile,
      String name, String description) async {
    await collectionReference.add({
      'uid': uid,
      'uname': uname,
      'picture': imageFile,
      'name': name,
      'description': description,
    });
  }

  static Future<QuerySnapshot<Object?>> getAll() async {
    return await collectionReference.get();
  }

  static Future<QuerySnapshot<Object?>> getUserList(String uid) async {
    return await collectionReference.where('uid', isEqualTo: uid).get();
  }

  static Future<void> delete(String uid) async {
    return await collectionReference.doc(uid).delete();
  }
}
