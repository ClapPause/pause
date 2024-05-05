import 'package:json_annotation/json_annotation.dart';
part 'information.g.dart';

@JsonSerializable()
class Information {
  final String id;
  final String uid;
  final String phone;
  final String birthday;
  final String job;

  Information({
    required this.id,
    required this.uid,
    required this.phone,
    required this.birthday,
    required this.job
  });

  factory Information.fromJson(Map<String, dynamic> json) => _$InformationFromJson(json);
  Map<String, dynamic> toJson() => _$InformationToJson(this);
}
