import 'dart:io';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BookmarkModel {
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('bookmark');

  static Future<void> create(String uid, String uname, File? imageFile,
      String name, String description) async {
    String filename = basename(imageFile!.path);

    Reference ref = FirebaseStorage.instance.ref('bookmark/').child(filename);
    UploadTask task = ref.putFile(imageFile);
    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    await collectionReference.add({
      'uid': uid,
      'uname': uname,
      'picture': urlDownload,
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
