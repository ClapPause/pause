import 'package:json_annotation/json_annotation.dart';
part 'information.g.dart';

@JsonSerializable()
class Information {
  final String id;
  final String uid;
  final String name;
  final String phone;
  final String birthday;
  final String job;
  final String gender;

  Information({
    required this.id,
    required this.uid,
    required this.name,
    required this.phone,
    required this.birthday,
    required this.job,
    required this.gender,
  });

  factory Information.fromJson(Map<String, dynamic> json) => _$InformationFromJson(json);
  Map<String, dynamic> toJson() => _$InformationToJson(this);
}
