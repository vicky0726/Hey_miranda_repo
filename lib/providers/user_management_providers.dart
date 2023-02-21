import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/api/api_services.dart';
import 'package:hey_miranda_repo/models/SignUpModel.dart';
import 'package:hey_miranda_repo/screens/create_profile.dart';
import 'package:hey_miranda_repo/screens/main_screen.dart';
import 'package:hey_miranda_repo/screens/miranda_main.dart';
import 'package:hey_miranda_repo/screens/otp_verification.dart';
import 'package:hey_miranda_repo/screens/reset_password.dart';
import 'package:hey_miranda_repo/utils/SharedPrefrence.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class UserManagementProvider extends ChangeNotifier {
  String? otp;

  ///================= Check User Provider ================
  Future<void> checkUserProcess(BuildContext context,
      String? email,
      String? password,) async {
    try {
      Common1.showLoading(context);
      var response = await ApiServices.checkUserApi(context, email!, password!);
      if (response != null) {
        if (response.status == true) {
          Common1.hideLoading(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OtpVerification(
                      email: email,
                      password: password,
                      otp: response.otp.toString(),
                    )),
          );
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        } else if (response.status == false) {
          Common1.hideLoading(context);
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        }
      } else {
        Common1.hideLoading(context);
        Common.showSnackBar(Constants.somethingWrongError, context);
        notifyListeners();
      }
    } on SocketException {
      Common.showSnackBar(Constants.internetIssue, context);
      Common1.hideLoading(context);
      notifyListeners();
    } catch (e) {
      Common1.hideLoading(context);
      Common.showSnackBar(Constants.somethingWrongError, context);
      notifyListeners();
    }
  }

// \\\************** Sign Up Provider \\\\\\\\\\\\\\\\\\\\\\\\

  Future<void> signUpProcess(BuildContext context,
      String? email,
      String? password,
      String? otp,) async {
    try {
      Common1.showLoading(context);
      var response =
      await ApiServices.signUpApi(context, email!, password!, otp!);
      if (response != null) {
        if (response.status == true) {
          Common1.hideLoading(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateProfile()),
          );
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        } else if (response.status == false) {
          Common1.hideLoading(context);
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        }
      } else {
        Common1.hideLoading(context);
        Common.showSnackBar(Constants.somethingWrongError, context);
        notifyListeners();
      }
    } on SocketException {
      Common.showSnackBar(Constants.internetIssue, context);
      Common1.hideLoading(context);
      notifyListeners();
    } catch (e) {
      Common1.hideLoading(context);
      Common.showSnackBar(Constants.somethingWrongError, context);
      notifyListeners();
    }
  }

  ///============== Login Api Provider ===================
  Future<void> loginProcess(BuildContext context, String email,
      String password) async {
    try {
      Common1.showLoading(context);
      var response = await ApiServices.loginApi(context, email, password);
      if (response != null) {
        if (response.status == true) {
          Common1.hideLoading(context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MirandaMain()),
          );
          Common.showSnackBar(response.message.toString(), context);

          /// Do Navigation
        } else if (response.status == false) {
          Common1.hideLoading(context);
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        }
      } else {
        Common1.hideLoading(context);
        Common.showSnackBar(Constants.somethingWrongError, context);
        notifyListeners();
      }
    } on SocketException {
      Common.showSnackBar(Constants.internetIssue, context);
      Common1.hideLoading(context);
      notifyListeners();
    } catch (e) {
      Common1.hideLoading(context);
      Common.showSnackBar(Constants.somethingWrongError, context);
      notifyListeners();
    }
  }

  ///============== Forgot Password Api Provider ===================
  Future<void> forgotPasswordProcess(BuildContext context, String email) async {
    try {
      Common1.showLoading(context);
      var response = await ApiServices.forgotPasswordApi(context, email);
      if (response != null) {
        if (response.status == true) {
          ////////// Do the work
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ResetPassword(
                    otp: response.otp.toString(),
                    email: email,
                  )));
        } else if (response.status == false) {
          Common1.hideLoading(context);
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        }
      } else {
        Common1.hideLoading(context);
        Common.showSnackBar(Constants.somethingWrongError, context);
        notifyListeners();
      }
    } on SocketException {
      Common.showSnackBar(Constants.internetIssue, context);
      Common1.hideLoading(context);
      notifyListeners();
    } catch (e) {
      Common1.hideLoading(context);
      Common.showSnackBar(Constants.somethingWrongError, context);
      notifyListeners();
    }
  }

  ///============== Reset Password Api Provider ===================
  Future<void> resetPasswordProcess(BuildContext context, String email,
      String password, String otp) async {
    try {
      Common1.showLoading(context);
      var response = await ApiServices.resetPasswordApi(
          context, email, password, otp);
      if (response != null) {
        if (response.status == true) {
          ////////// Do the work
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MirandaMain()));
        } else if (response.status == false) {
          Common1.hideLoading(context);
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        }
      } else {
        Common1.hideLoading(context);
        Common.showSnackBar(Constants.somethingWrongError, context);
        notifyListeners();
      }
    }
    on SocketException {
      Common.showSnackBar(Constants.internetIssue, context);
      Common1.hideLoading(context);
      notifyListeners();
    } catch (e) {
      Common1.hideLoading(context);
      Common.showSnackBar(Constants.somethingWrongError, context);
      notifyListeners();
    }
  }

  ///============== Change Password Api Provider ===================
  Future<void> changePasswordProcess(BuildContext context,
      String current_password, String new_password, String confirm_password)async {
    try {
      Common1.showLoading(context);
      var response = await ApiServices.changePasswordApi(
          context, current_password, new_password, confirm_password);
      if (response != null) {
        if (response.status == true) {
          ////////// Do the work
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MirandaMain()));
          Common.showSnackBar(response.message!, context);
        } else if (response.status == false) {
          Common1.hideLoading(context);
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        }
      } else {
        Common1.hideLoading(context);
        Common.showSnackBar(Constants.somethingWrongError, context);
        notifyListeners();
      }
    }
    on SocketException {
      Common.showSnackBar(Constants.internetIssue, context);
      Common1.hideLoading(context);
      notifyListeners();
    } catch (e) {
      Common1.hideLoading(context);
      Common.showSnackBar(Constants.somethingWrongError, context);
      notifyListeners();
    }
  }

  ///============== Logout Api Provider ===================
  Future<void> logoutProcess(BuildContext context)async{
    try {
      Common1.showLoading(context);
      var response = await ApiServices.logoutApi(context);
      if (response != null) {
        if (response.status == true) {
          ////////// Do the work
          CustomPreferences.clearAll();
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              MainScreen()), (Route<dynamic> route) => false);
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => MirandaMain()));
          Common.showSnackBar(response.message!, context);
        } else if (response.status == false) {
          Common1.hideLoading(context);
          Common.showSnackBar(response.message.toString(), context);
          notifyListeners();
        }
      } else {
        Common1.hideLoading(context);
        Common.showSnackBar(Constants.somethingWrongError, context);
        notifyListeners();
      }
    }
  on SocketException {
    Common.showSnackBar(Constants.internetIssue, context);
    Common1.hideLoading(context);
    notifyListeners();
  } catch (e) {
    Common1.hideLoading(context);
    Common.showSnackBar(Constants.somethingWrongError, context);
    notifyListeners();
  }
  }
}
