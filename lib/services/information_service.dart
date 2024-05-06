import 'dart:developer';

import 'package:pause/models/information/information.dart';
import 'package:pause/services/data_service.dart';
import 'package:pause/services/firebase_service.dart';
import 'package:pause/services/user_service.dart';

class InformationService {
  static const String _collection = 'information';

  static Future<Information?> uploadInformation(
      String userId, Map<String, dynamic> informationData) async {
    try {
      final snapshot = await FirebaseService.fireStore.collection(_collection).where('uid',isEqualTo: userId).get();
      if(snapshot.docs.isNotEmpty) return null;
      String? id = await DataService.getId(name: _collection);
      Information information = Information.fromJson({
        "id": id,
        "uid": userId,
        ...informationData,
      });
      await UserService.update(
          id: userId, field: "name", value: informationData["name"]);
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

  static Future<Information?> updateInformation(Information updatedInformation) async {
    try {
      await UserService.update(
          id: updatedInformation.uid,
          field: "name",
          value: updatedInformation.name);

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

  static Future<Information?> getInformation(String userId) async {
    try {
      final snapshot = await
      FirebaseService.fireStore.collection(_collection).where('uid',isEqualTo: userId).get();
      if (snapshot.docs.isNotEmpty) {
        return Information.fromJson(snapshot.docs.first.data());
      }
    } catch (e) {
      log('InformationService/getInformation error : $e');
      return null;
    }
  }
}
