import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future fetchAllData({required String endpoint}) async {
    try {
      var snapshot = await firestore
          .collection(endpoint)
          .orderBy('created_at', descending: true)
          .get();
      if (snapshot.docs.isEmpty) {
        return null;
      } else {
        return snapshot.docs;
      }
    } catch (e) {
      log('Error => $e');
      return null;
    }
  }

  Future<DocumentSnapshot?> fetchDataById(
      {required String endpoint, required String id}) async {
    try {
      DocumentReference doc = firestore.collection(endpoint).doc(id);
      DocumentSnapshot snapshot = await doc.get();
      if (snapshot.data() == null) {
        return null;
      } else {
        return snapshot;
      }
    } catch (e) {
      log('Error => $e');
      return null;
    }
  }

  Future<List<DocumentSnapshot?>> fetchDataByFilter(
      {required String endpoint,
      required String key,
      required String value}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection(endpoint)
          .where(key, isEqualTo: value)
          .get();

      if (snapshot.docs.isEmpty) {
        return [];
      } else {
        return snapshot.docs;
      }
    } catch (e) {
      log('Error => $e');
      return [];
    }
  }

  Future fetchByLimit(
      {required String endpoint,
      required int limit,
      required String idLast}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection(endpoint)
          .limit(limit)
          .startAfter([idLast]).get();

      if (snapshot.docs.isEmpty) {
        return null;
      } else {
        return snapshot.docs;
      }
    } catch (e) {
      log('Error => $e');
      return null;
    }
  }

  Future postData(
      {required String endpoint, required Map data, required String id}) async {
    DocumentReference doc = firestore.collection(endpoint).doc(id);
    await doc.set(data);

    return data;
  }
}
