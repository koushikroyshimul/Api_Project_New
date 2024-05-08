// To parse this JSON data, do
//
//     final getApi = getApiFromJson(jsonString);

import 'dart:convert';

GetApi getApiFromJson(String str) => GetApi.fromJson(json.decode(str));

String getApiToJson(GetApi data) => json.encode(data.toJson());

class GetApi {
  String id;
  String name;
  String roll;
  String dept;
  String createdBy;
  DateTime createdAt;

  GetApi({
    required this.id,
    required this.name,
    required this.roll,
    required this.dept,
    required this.createdBy,
    required this.createdAt,
  });

  factory GetApi.fromJson(Map<String, dynamic> json) => GetApi(
    id: json["id"],
    name: json["name"],
    roll: json["roll"],
    dept: json["dept"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "roll": roll,
    "dept": dept,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
  };
}
