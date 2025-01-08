// To parse this JSON data, do
//
//     final addTaskModel = addTaskModelFromJson(jsonString);

import 'dart:convert';

AddTaskModel addTaskModelFromJson(String str) =>
    AddTaskModel.fromJson(json.decode(str));

String addTaskModelToJson(AddTaskModel data) => json.encode(data.toJson());

class AddTaskModel {
  bool? success;
  String? message;
  String? taskId;
  String? roleName;
  int? usercount;

  AddTaskModel({
    this.success,
    this.message,
    this.taskId,
    this.usercount,
    this.roleName,
  });

  factory AddTaskModel.fromJson(Map<String, dynamic> json) => AddTaskModel(
        success: json["success"],
        message: json["message"],
        taskId: json["task_id"],
        usercount: json["user_count"],
        roleName: json["role_name"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "task_id": taskId,
        "user_count": usercount,
        "role_name": roleName,
      };
}
