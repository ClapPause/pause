// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Information _$InformationFromJson(Map<String, dynamic> json) => Information(
      id: json['id'] as String,
      uid: json['uid'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      birthday: json['birthday'] as String,
      job: json['job'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$InformationToJson(Information instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'job': instance.job,
      'gender': instance.gender,
    };
