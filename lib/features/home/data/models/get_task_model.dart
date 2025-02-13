// To parse this JSON data, do
//
//     final getTaskModel = getTaskModelFromJson(jsonString);

import 'dart:convert';

GetTaskModel getTaskModelFromJson(String str) =>
    GetTaskModel.fromJson(json.decode(str));

String getTaskModelToJson(GetTaskModel data) => json.encode(data.toJson());

class GetTaskModel {
  String? status;
  List<Datum> data;

  GetTaskModel({
    this.status,
    List<Datum>? data,
  }) : data = data ?? [];

  factory GetTaskModel.fromJson(Map<String, dynamic> json) => GetTaskModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? title;
  String? description;
  String? status;
  String? notes;
  DateTime? deadline;
  int? assignedRoleId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.title,
    this.description,
    this.status,
    this.notes,
    this.deadline,
    this.assignedRoleId,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        notes: json["notes"],
        deadline:
            json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        assignedRoleId: json["assigned_role_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "notes": notes,
        "deadline":
            "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
        "assigned_role_id": assignedRoleId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
