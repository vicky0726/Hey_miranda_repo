import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hey_miranda_repo/api/parms.dart';
import 'package:hey_miranda_repo/api/urls.dart';
import 'package:hey_miranda_repo/models/CheckUserModel.dart';
import 'package:hey_miranda_repo/models/LoginModel.dart';
import 'package:hey_miranda_repo/models/LogoutModel.dart';
import 'package:hey_miranda_repo/models/Reset_Password_Model.dart';
import 'package:hey_miranda_repo/models/access_token_model.dart';
import 'package:hey_miranda_repo/models/forgot_password_model.dart';
import 'package:hey_miranda_repo/screens/otp_verification.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/SharedPrefrence.dart';
import 'package:http/http.dart' as http;
import '../models/Change_Password_Model.dart';
import '../models/SignUpModel.dart';
import '../screens/forgot_password.dart';




class ApiServices {

  ////***************** get device id Api *******************************
  static Future<String> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      await CustomPreferences.setPreferences(
          Params.device_uniqueid, iosDeviceInfo.identifierForVendor);
      await CustomPreferences.setPreferences(Params.device_type, "IOS");
      return iosDeviceInfo.identifierForVendor;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      await CustomPreferences.setPreferences(
          Params.device_uniqueid, androidDeviceInfo.androidId);
      await CustomPreferences.setPreferences(Params.device_type, "ANDROID");
      return androidDeviceInfo.androidId;
    }
  }

  ///================== Get Auth Token Api =============
  static Future<GetAccessTokenModel?> getAuthTokenApi() async {
    try {
      final response = await http.post(
        Uri.parse("https://demo.dev9server.com/hey-miranda/api/access-token"),
        body: {
          'access_token': 'access_heymiranda_token',
        },
        headers: {
          'Authorization': 'Basic aGV5X21pcmFuZGE6MFU5dzg0YXoxeUhDWDMyVFhhekw=',
        },
      );
      response.body;
      Map<String, dynamic> responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        GetAccessTokenModel authTokenData =
        GetAccessTokenModel.fromJson(responseJson);
        CustomPreferences.setPreferences(
            Params.auth_token, authTokenData.data!.authToken!);
        return authTokenData;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }


  ///================== Check User Api ========
  static Future<CheckUserModel?> checkUserApi(BuildContext context,
      String email,String password) async {
    var authToken = await CustomPreferences.getPreferences(Params.auth_token);
    try {
      final response = await http.post(
        Uri.parse(Urls.baseUrl + Urls.checkUserUrl),
        body: {
          Params.email: email,
          Params.password: password,

        },
        headers: {
          Params.authorization:
          'Basic aGV5X21pcmFuZGE6MFU5dzg0YXoxeUhDWDMyVFhhekw=',
          Params.auth_token: authToken,
        },
      );
      Map<String, dynamic> responseJson = json.decode(response.body);

      if (response.statusCode == 200) {
        print(responseJson);
        CheckUserModel checkUserData =
        await CheckUserModel.fromJson(responseJson);

        return checkUserData;
      } else if (response.statusCode == 401) {
        // deactivate(context, responseJson["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  ///================== Register (Signup) Api =============
  static Future<SignUpModel?> signUpApi(BuildContext context, String email,
      String password, String otp) async {
    var authToken = await CustomPreferences.getPreferences(Params.auth_token);

    try {
      final responce = await http.post(Uri.parse(
          'https://demo.dev9server.com/hey-miranda/api/sign-up'),
        body: {
          'email': email,
          'password': password,
          'device_type': 'ANDROID',
          'device_token': '1234567',
          'device_uniqueid': "11223344556677",
          'user_role': '1',
          'otp': otp,
          'confirm_password': 'password',
        },
        headers: {
          Params.authorization:
          'Basic aGV5X21pcmFuZGE6MFU5dzg0YXoxeUhDWDMyVFhhekw=',
          Params.auth_token: authToken,
        },
      );
      Map<String, dynamic> responceJson = json.decode(responce.body);

      if (responce.statusCode == 200) {
        print(responceJson);
        SignUpModel signUpData = await SignUpModel.fromJson(responceJson);
        return signUpData;
      } else {
        Common.showSnackBar('Please Enter correct email and password', context);
      }
    }
    catch (e) {
      rethrow;
    }
    return
      null;
  }

  ///================== Login Api =============
  static Future<LoginModel?> loginApi(
      BuildContext context, String email, String password) async {
    String deviceUniqueId =
    await CustomPreferences.getPreferences(Params.device_uniqueid);
    String deviceType =
    await CustomPreferences.getPreferences(Params.device_type);
    var authToken = await CustomPreferences.getPreferences(Params.auth_token);
    // var notificationToken =
    // await CustomPreferences.getPreferences(Params.notificationToken);
    try {
      final response = await http.post(
        Uri.parse(Urls.baseUrl + Urls.loginUrl),
        body: {
          'email': email,
          'password': password,
          'device_type': 'ANDROID',
          'device_token': '343443rerd45',
          'device_uniqueid': "dds4343434we",
          'user_role': '2',
        },
        headers: {
          Params.authorization:
          'Basic aGV5X21pcmFuZGE6MFU5dzg0YXoxeUhDWDMyVFhhekw=',
          Params.auth_token: authToken,
        },
      );
      Map<String, dynamic> responseJson = json.decode(response.body);

      if (response.statusCode == 200) {
        print(responseJson);
        // String? jsonString = json.decode(response.body);
        return LoginModel.fromJson(responseJson);
      } else if (response.statusCode == 201) {
        Common.showSnackBar(
            'Your account is deactivated, please contact adminstrator.',
            context);
      } else if (response.statusCode == 401) {
        // deactivate(context, responseJson["message"]);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }


  ///================== Forgot Password Api =============
  static Future<ForgotPasswordModel?> forgotPasswordApi(BuildContext context, String email) async {
    var authToken = await CustomPreferences.getPreferences(Params.auth_token);
    try {
      ///************** first Part *********************************************
      final response = await http.post(
        Uri.parse(Urls.baseUrl + Urls.forgotPasswordUrl),
        body: {
          'email': email,
        },
        headers: {
          Params.authorization: Urls.authorization,
          Params.auth_token: authToken,
        },
      );
      ///=======================================================================
      ///************** End Part *********************************************
      Map<String, dynamic> responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print(responseJson);
        return ForgotPasswordModel.fromJson(responseJson);
      } else if (response.statusCode == 201) {
        Common.showSnackBar(
            'Your account is deactivated, please contact adminstrator.',
            context);
      }
      ///=======================================================================
    } catch (e) {
      rethrow;
    }
  }

  //////======= Reset Password Api=======//////
  static Future<ResetPasswordModel?> resetPasswordApi(BuildContext context, String email,String password, String otp) async {
    var authToken = await CustomPreferences.getPreferences(Params.auth_token);
    try{
      final response = await http.post(
        Uri.parse(Urls.baseUrl + Urls.resetPasswordUrl),
        body: {
          'email': email,
          'password': password,
          'otp': otp,
        },
        headers: {
          Params.authorization: Urls.authorization,
          Params.auth_token: authToken,
        },
      );
      ///************** End Part *********************************************
      Map<String, dynamic> responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print(responseJson);
        return ResetPasswordModel.fromJson(responseJson);
      } else if (response.statusCode == 201) {
        Common.showSnackBar(
            'Your account is deactivated, please contact adminstrator.',
            context);
      }
      ///=======================================================================
    } catch (e){
      rethrow;
    }
  }

//////======= Change Password Api=======//////

 static Future<ChangePasswordModel?> changePasswordApi(BuildContext context, String current_password, String new_password, String confirm_password)async{
   var authToken = await CustomPreferences.getPreferences(Params.auth_token);
  try{
    final response = await http.post(
        Uri.parse(Urls.baseUrl + Urls.changePasswordUrl),
        body: {
          'current_password': current_password,
          'new_password': new_password,
          'confirm_password': confirm_password,
        },
        headers: {
          Params.authorization: Urls.authorizationB,
          Params.auth_token: authToken,
        },
    );
    ///************** End Part *********************************************
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      print(responseJson);
      return ChangePasswordModel.fromJson(responseJson);
    } else if (response.statusCode == 201) {
      Common.showSnackBar(
          'Your account is deactivated, please contact adminstrator.',
          context);
    }

  } catch (e){
    rethrow;
  }
 }


//////======= Logout Api=======//////
  static Future<LogoutModel?> logoutApi(BuildContext context,) async {
    var authToken = await CustomPreferences.getPreferences(Params.auth_token);

    try{
      final response = await http.post(
        Uri.parse(Urls.baseUrl + Urls.logoutUrl),
        // body: {
        //   'device_token': device_token,
        //   'device_type':  Platform.isIOS ? "IOS":"ANDROID",
        // },
        headers: {
          Params.authorization: Urls.authorizationlogout,
          Params.auth_token: authToken,
        },
      );
      Map<String, dynamic> responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print(responseJson);
        return LogoutModel.fromJson(responseJson);
      } else if (response.statusCode == 201) {
        Common.showSnackBar(
            'Your account is deactivated, please contact adminstrator.',
            context);
      }
    } catch (e){
      rethrow;
    }
  }
}