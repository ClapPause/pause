import 'dart:developer';

import 'package:pause/models/information/information.dart';
import 'package:pause/services/data_service.dart';
import 'package:pause/services/firebase_service.dart';
import 'package:pause/services/index_service.dart';

class InformationService {
  static const String _collection = 'information';

  Future<Information?> uploadInformation(
      String userId, Map<String, dynamic> informationData) async {
    try {
      String? id = await DataService.getId(name: _collection);
      Information information = Information.fromJson({
        "id": id,
        "uid": userId,
        ...informationData,
      });
      await FirebaseService.fireStore
          .collection(_collection)
          .doc(information.id)
          .set(information.toJson());
      return information;
    } catch (e) {
      log('InformationService/uploadInformation error : $e');
      return null;
    }
  }

  Future<Information?> updateInformation(
      Information updatedInformation) async {
    try {
      await FirebaseService.fireStore
          .collection(_collection)
          .doc(updatedInformation.id)
          .update(updatedInformation.toJson());
      return updatedInformation;
    } catch (e) {
      log('InformationService/updateInformation error : $e');
      return null;
    }
  }

  Future<Information?> getInformation(String userId) async {
    try {
      await FirebaseService.fireStore.runTransaction((transaction) async {
        final snapshot = await transaction
            .get(FirebaseService.fireStore.collection(_collection).doc(userId));
        if (snapshot.exists) {
          return Information.fromJson(snapshot.data() as Map<String, dynamic>);
        }
      });
      return null;
    } catch (e) {
      log('InformationService/getInformation error : $e');
      return null;
    }
  }
}
