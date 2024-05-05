import 'dart:developer';

import 'package:pause/services/firebase_service.dart';

class IndexService {
  static const String _collection = 'index';

  Future<int?> getId(String collection) async {
    try {
      int? index;
      await FirebaseService.fireStore.runTransaction((transaction) async {
        final snapshot = await transaction.get(
            FirebaseService.fireStore.collection(_collection).doc(collection));
        if (snapshot.exists) {
          index = snapshot.get('index');
        }
      });
      return index;
    } catch (e) {
      log('IndexService/getId error : $e');
      return null;
    }
  }
}
