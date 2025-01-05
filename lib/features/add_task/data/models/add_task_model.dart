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
  int? assignedTo;

  AddTaskModel({
    this.success,
    this.message,
    this.taskId,
    this.assignedTo,
  });

  factory AddTaskModel.fromJson(Map<String, dynamic> json) => AddTaskModel(
        success: json["success"],
        message: json["message"],
        taskId: json["task_id"],
        assignedTo: json["assigned_to"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "task_id": taskId,
        "assigned_to": assignedTo,
      };
}
