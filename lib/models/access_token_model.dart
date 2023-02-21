// To parse this JSON data, do
//
//     final getAccessTokenModel = getAccessTokenModelFromJson(jsonString);

import 'dart:convert';

GetAccessTokenModel getAccessTokenModelFromJson(String str) => GetAccessTokenModel.fromJson(json.decode(str));

String getAccessTokenModelToJson(GetAccessTokenModel data) => json.encode(data.toJson());

class GetAccessTokenModel {
  GetAccessTokenModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory GetAccessTokenModel.fromJson(Map<String, dynamic> json) => GetAccessTokenModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.authToken,
  });

  String? authToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    authToken: json["auth_token"],
  );

  Map<String, dynamic> toJson() => {
    "auth_token": authToken,
  };
}
