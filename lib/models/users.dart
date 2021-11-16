import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  static CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');

  static Future<void> createOrUpdate(String uid, String? name, String? email, String? phone, String? address) async {
    try {
      await collectionReference.doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address
      }, SetOptions(merge: true));
    } catch (e) {
      print(e.toString);
    }
  }

  static Future<DocumentSnapshot<Object?>> getData(String uid) async {
    return await collectionReference.doc(uid).get();
  }
}