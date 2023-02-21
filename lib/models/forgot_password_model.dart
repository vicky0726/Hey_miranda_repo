// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  ForgotPasswordModel({
    this.status,
    this.message,
    this.otp,
  });

  bool? status;
  String? message;
  int? otp;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
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
