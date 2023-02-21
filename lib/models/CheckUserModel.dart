// To parse this JSON data, do
//
//     final checkUserModel = checkUserModelFromJson(jsonString);

import 'dart:convert';

CheckUserModel checkUserModelFromJson(String str) => CheckUserModel.fromJson(json.decode(str));

String checkUserModelToJson(CheckUserModel data) => json.encode(data.toJson());

class CheckUserModel {
  CheckUserModel({
    this.status,
    this.message,
    this.otp,
  });

  bool? status;
  String? message;
  int? otp;

  factory CheckUserModel.fromJson(Map<String, dynamic> json) => CheckUserModel(
    status: json["status"],
    message: json["message"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "otp": otp,
  };
}
