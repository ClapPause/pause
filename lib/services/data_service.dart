import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_service.dart';

class DataService {
  static final DataService _instance = DataService._internal();

  factory DataService() => _instance;

  DataService._internal();

  //Data

  static const String collection = 'data';

  static Future<String?> getId({required String name}) async {
    try {
      String? id;
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference documentReference =
            FirebaseFirestore.instance.collection(collection).doc(name);
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        int count = snapshot.get('count');
        transaction.update(documentReference, {'count': count + 1});

        id = '$count';
      });

      return id;
    } catch (e) {
      log('DataService - getId Failed : $e');
      return null;
    }
  }

  static Future<bool> canAppUse(String os, String appVersion) async {
    try {
      final snapshot = await FirebaseService.fireStore
          .collection(collection)
          .doc('appVersion')
          .get();

      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data();
        if (data == null) return false;
        List versionList = data['${os}VersionList'];
        return versionList.contains(appVersion);
      }
      return false;
    } catch (e) {
      log('DataService - getStoreAppVersion Failed : $e');
      return false;
    }
  }
}
