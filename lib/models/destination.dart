import 'dart:io';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DestinationModel {
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('destination');

  static Future<void> create(
      String uid,
      String uname,
      String name,
      String province,
      String description,
      String city,
      String address,
      String maps,
      File? imageFile,) async {
    String filename = basename(imageFile!.path);

    Reference ref =
        FirebaseStorage.instance.ref('destination/').child(filename);
    UploadTask task = ref.putFile(imageFile);
    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    await collectionReference.add({
      'uid': uid,
      'uname': uname,
      'picture': urlDownload,
      'name': name,
      'province': province,
      'description': description,
      'address': address,
      'city': city,
      'maps': maps,
    });
  }

  static Future<QuerySnapshot<Object?>> getAll() async {
    return await collectionReference.get();
  }

  static Future<QuerySnapshot<Object?>> getGrouppedDestination(String province) async {
    return await collectionReference.where('province', isEqualTo: province).get();
  }

  static Future<String> getTotalDestination(String province) async {
    var querySnapshot = await collectionReference.where('province', isEqualTo: province).get();
    var totalEquals = querySnapshot.docs.length;

    return totalEquals.toString();
  }

  static Future<void> delete(String uid) async {
    return await collectionReference.doc(uid).delete();
  }
}
