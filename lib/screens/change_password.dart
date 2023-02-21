import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/screens/main_screen.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/utils/validator.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var formkey = GlobalKey<FormState>();
  TextEditingController currentpasswordContoller = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passVisibility = true;
  bool _passVisibility1 = true;
  bool _passVisibility2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.changepassword,
          style: TextStyle(
              color: AppColors.whitetext,
              fontSize: 21,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: Common.commonBox(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: Common.displayHeight(context) * 0.06,
                ),
                Center(
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 130,
                  ),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z0-9!@#$%^&*.]")),
                    ],
                    controller: currentpasswordContoller,
                    textInputAction: TextInputAction.done,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'please enter current Password';
                      }
                      return null;
                    },
                    maxLength: 16,
                    obscureText: _passVisibility,
                    cursorHeight: 20,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    autofocus: false,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
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
                        ),
                      ),
                      fillColor: Color.fromRGBO(229, 229, 229, 1),
                      filled: true,
                      hintText: Constants.currentPassword,
                      counterText: '',
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    maxLength: 16,
                    obscureText: _passVisibility1,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'please type Password';
                      } else if (input.length < 6) {
                        return 'please provide minimum 6 charters';
                      } else if (input.length > 15) {
                        return 'Password can not be greater than 15 characters';
                      } else if (Validator.isValidPassword(input)) {
                        return 'Please should contain Capital & Small Characters, Special Symbol & Digits';
                      }
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
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    cursorColor: Colors.black,
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
                        ),
                      ),
                      fillColor: Color.fromRGBO(229, 229, 229, 1),
                      filled: true,
                      hintText: Constants.newpassword,
                      hintStyle: TextStyle(fontSize: 16),
                      counterText: '',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _passVisibility1 = !_passVisibility1;
                          setState(() {});
                        },
                        icon: _passVisibility1
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: repasswordController,
                    // validator: (input) {
                    //   if (input!.isEmpty) {
                    //     return 'please Conform Password';
                    //   } else if (input.length < 6) {
                    //     return 'please provide minimum 6 charters';
                    //   } else if(input.length > 15 ) {
                    //     return 'Password can not be greater than 15 characters';
                    //   }
                    //   else if (repasswordController.text !=
                    //       passwordController.text) {
                    //     return 'Password & Confirm Password should be same.';
                    //   }
                    //   return null;
                    // },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z0-9!@#$%^&*.]")),
                    ],
                    obscureText: _passVisibility2,
                    cursorHeight: 20,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    autofocus: false,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
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
                        ),
                      ),
                      fillColor: Color.fromRGBO(229, 229, 229, 1),
                      filled: true,
                      hintText: Constants.confirmnewpassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _passVisibility2 = !_passVisibility2;
                          setState(() {});
                        },
                        icon: _passVisibility2
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.1,
                ),
                CustomElevatedButton(
                    onPressed: () {
                      Provider.of<UserManagementProvider>(context,
                              listen: false)
                          .changePasswordProcess(
                              context,
                              currentpasswordContoller.text,
                              passwordController.text,
                              repasswordController.text);
                    },
                    text: Constants.save)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
