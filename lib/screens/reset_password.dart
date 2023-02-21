import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_miranda_repo/api/parms.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/screens/otp_verification.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  final String otp;
  final String email;

  const ResetPassword({Key? key, required this.otp, required this.email})
      : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController codeController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passVisibility = true;
  bool _passVisibility1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightblue1,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Common.displayHeight(context) * 1,
          width: double.infinity,
          decoration: Common.commonBox(),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Column(
              children: [
                Text(
                  Constants.resetpass,
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.whitetext,
                    fontFamily: 'Basic Sans SF Regular',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: Common.displayHeight(context) * 0.2,
                    ),
                    TextFormField(
                      controller: codeController,
                      textInputAction: TextInputAction.next,
                      obscureText: _passVisibility,
                      keyboardType: TextInputType.visiblePassword,
                      maxLength: 12,
                      cursorColor: Colors.black,
                      // obscureText: hidden2,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'please type Password';
                        } else if (input.length < 6) {
                          return 'please provide minimum 6 charters';
                        } else if (input.length > 15) {
                          return 'Password can not be greater than 15 characters';
                        }
                        // else if(Validator.isValidPassword(input)) {
                        //   return 'Please should contain Capital & Small Characters, Special Symbol & Digits';
                        // }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z0-9!@#$%^&*.]")),
                      ],
                      cursorHeight: 20,
                      autofocus: false,
                      onTap: () {},
                      style: TextStyle(color: Colors.black),
// controller: Controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        focusedErrorBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              width: 0.0),
                        ),
                        fillColor: Color.fromRGBO(229, 229, 229, 1),
                        filled: true,
                        hintText: Constants.code,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _passVisibility = !_passVisibility;
                            setState(() {});
                          },
                          icon: _passVisibility
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          color: Colors.grey,
                        ),
                        prefixStyle: const TextStyle(color: Colors.white),
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      obscureText: _passVisibility,
                      keyboardType: TextInputType.visiblePassword,
                      maxLength: 12,
                      cursorColor: Colors.black,
                      // obscureText: hidden2,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'please type Password';
                        } else if (input.length < 6) {
                          return 'please provide minimum 6 charters';
                        } else if (input.length > 15) {
                          return 'Password can not be greater than 15 characters';
                        }
                        // else if(Validator.isValidPassword(input)) {
                        //   return 'Please should contain Capital & Small Characters, Special Symbol & Digits';
                        // }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z0-9!@#$%^&*.]")),
                      ],
                      cursorHeight: 20,
                      autofocus: false,
                      onTap: () {},
                      style: TextStyle(color: Colors.black),
// controller: Controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        focusedErrorBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              width: 0.0),
                        ),
                        fillColor: Color.fromRGBO(229, 229, 229, 1),
                        filled: true,
                        hintText: Constants.newpassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _passVisibility = !_passVisibility;
                            setState(() {});
                          },
                          icon: _passVisibility
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          color: Colors.grey,
                        ),
                        prefixStyle: const TextStyle(color: Colors.white),
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      maxLength: 12,
                      cursorColor: Colors.black,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'please Re enter Password';
                        } else if (input.length < 6) {
                          return 'please provide minimum 6 charters';
                        } else if (input.length > 15) {
                          return 'Password can not be greater than 15 characters';
                        } else if (repasswordController.text !=
                            passwordController.text) {
                          return 'Password & Confirm Password should be same.';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z0-9!@#$%^&*.]")),
                      ],
                      controller: repasswordController,
                      textInputAction: TextInputAction.next,
                      obscureText: _passVisibility1,
                      keyboardType: TextInputType.visiblePassword,
                      cursorHeight: 20,
                      autofocus: false,
                      onTap: () {},
                      style: TextStyle(color: Colors.black),
// controller: Controller,
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1))),
                        focusedErrorBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              width: 0.0),
                        ),
                        fillColor: Color.fromRGBO(229, 229, 229, 1),
                        filled: true,
                        hintText: Constants.confirmnewpassword,
                        suffixIcon: IconButton(
                            onPressed: () {
                              _passVisibility1 = !_passVisibility1;
                              setState(() {});
                            },
                            icon: _passVisibility1
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  )),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.20,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Constants.didnotreciveemail,
                      style:
                          TextStyle(fontSize: 13, color: AppColors.whitetext),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    RichText(
                        text: TextSpan(
                            text: Constants.resendcode,
                            style: TextStyle(
                                color: AppColors.lightblue11, fontSize: 15)))
                  ],
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.04,
                ),
                CustomElevatedButton(
                    onPressed: () {
                      if(widget.otp == codeController.text) {
                        Provider.of<UserManagementProvider>(context,
                            listen: false)
                            .resetPasswordProcess(context,
                            widget.email, passwordController.text, widget.otp);
                      } else {
                        Common.showSnackBar('Please Enter a valid otp', context);
                      }

                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OtpVerification()));
                    },
                    text: Constants.confirm)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
