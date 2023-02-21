// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.otpVerify,
    this.userDoc,
    this.phoneNumber,
    this.countryCode,
    this.isSubadmin,
    this.userBio,
    this.address,
    this.state,
    this.country,
    this.profileImage,
    this.agancyId,
    this.designation,
    this.userRole,
    this.status,
    this.isDocumentUploaded,
    this.isDocumentVerified,
    this.isPrimium,
    this.notificationSetting,
    this.createdAt,
    this.updatedAt,
    this.deviceToken,
    this.deviceType,
    this.token,
    this.userDocUrl,
    this.agencyName,
  });

  int? id;
  dynamic name;
  String? email;
  dynamic emailVerifiedAt;
  int? otpVerify;
  String? userDoc;
  dynamic phoneNumber;
  dynamic countryCode;
  int? isSubadmin;
  dynamic userBio;
  dynamic address;
  dynamic state;
  dynamic country;
  String? profileImage;
  dynamic agancyId;
  dynamic designation;
  String? userRole;
  int? status;
  int? isDocumentUploaded;
  int? isDocumentVerified;
  int? isPrimium;
  int? notificationSetting;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deviceToken;
  String? deviceType;
  String? token;
  String? userDocUrl;
  dynamic agencyName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    otpVerify: json["otp_verify"],
    userDoc: json["user_doc"],
    phoneNumber: json["phone_number"],
    countryCode: json["country_code"],
    isSubadmin: json["is_subadmin"],
    userBio: json["user_bio"],
    address: json["address"],
    state: json["state"],
    country: json["country"],
    profileImage: json["profile_image"],
    agancyId: json["agancy_id"],
    designation: json["designation"],
    userRole: json["user_role"],
    status: json["status"],
    isDocumentUploaded: json["is_document_uploaded"],
    isDocumentVerified: json["is_document_verified"],
    isPrimium: json["is_primium"],
    notificationSetting: json["notification_setting"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deviceToken: json["device_token"],
    deviceType: json["device_type"],
    token: json["token"],
    userDocUrl: json["user_doc_url"],
    agencyName: json["agency_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "otp_verify": otpVerify,
    "user_doc": userDoc,
    "phone_number": phoneNumber,
    "country_code": countryCode,
    "is_subadmin": isSubadmin,
    "user_bio": userBio,
    "address": address,
    "state": state,
    "country": country,
    "profile_image": profileImage,
    "agancy_id": agancyId,
    "designation": designation,
    "user_role": userRole,
    "status": status,
    "is_document_uploaded": isDocumentUploaded,
    "is_document_verified": isDocumentVerified,
    "is_primium": isPrimium,
    "notification_setting": notificationSetting,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "device_token": deviceToken,
    "device_type": deviceType,
    "token": token,
    "user_doc_url": userDocUrl,
    "agency_name": agencyName,
  };
}
