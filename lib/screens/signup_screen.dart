import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/screens/otp_verification.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/utils/validator.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
import 'package:hey_miranda_repo/widgets/custom_loder.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Widget contentBox(context) {
  //   return GestureDetector(
  //     onTap: () {
  //       FocusScope.of(context).requestFocus(FocusNode());
  //     },
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               shape: BoxShape.rectangle,
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: SingleChildScrollView(
  //               scrollDirection: Axis.vertical,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: <Widget>[
  //                   SizedBox(height: Common.displayHeight(context) * 0.014),
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 8.0),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         SizedBox(
  //                             height: Common.displayHeight(context) * 0.02),
  //                         Padding(
  //                           padding: const EdgeInsets.symmetric(horizontal: 20),
  //                           child: Text(
  //                             'Signup succesfully',
  //                             maxLines: 2,
  //                             overflow: TextOverflow.ellipsis,
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(
  //                                 fontSize: 18, fontWeight: FontWeight.bold),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                             height: Common.displayHeight(context) * 0.03),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             // SizedBox(
  //                             //   width: Common.displayWidth(context) * 0.3,
  //                             //   height: Common.displayHeight(context) * 0.05,
  //                             //   // child: ElevatedButton(
  //                             //   //   style: ElevatedButton.styleFrom(
  //                             //   //     side: BorderSide(
  //                             //   //         width: 1, color: AppColors.lightblue10),
  //                             //   //     shape: RoundedRectangleBorder(
  //                             //   //         borderRadius:
  //                             //   //         BorderRadius.circular(10.0)),
  //                             //   //     backgroundColor: AppColors.whitetext,
  //                             //   //   ),
  //                             //   //   child: Text(
  //                             //   //     Constants.cancel,
  //                             //   //     style:
  //                             //   //     TextStyle(color: AppColors.lightblue10),
  //                             //   //   ),
  //                             //   //   onPressed: () {
  //                             //   //     Navigator.of(context).pop();
  //                             //   //   },
  //                             //   // ),
  //                             // ),
  //                             SizedBox(
  //                               width: Common.displayWidth(context) * 0.3,
  //                               height: Common.displayHeight(context) * 0.05,
  //                               child: ElevatedButton(
  //                                 style: ElevatedButton.styleFrom(
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(10.0)),
  //                                   backgroundColor: AppColors.lightblue10,
  //                                 ),
  //                                 child: Text(
  //                                   'ok',
  //                                   style:
  //                                       TextStyle(color: AppColors.whitetext),
  //                                 ),
  //                                 onPressed: () {
  //                                   Navigator.of(context).pushAndRemoveUntil(
  //                                       MaterialPageRoute(
  //                                           builder: (context) =>
  //                                               OtpVerification()),
  //                                       (Route<dynamic> route) => false);
  //                                 },
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(
  //                             height: Common.displayHeight(context) * 0.014),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  TextEditingController repasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passVisibility = true;
  bool _passVisibility1 = true;
  var formkey = GlobalKey<FormState>();
  int tabNumber = 0;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 40),
      child: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                controller: fullNameController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                cursorHeight: 20,
                autofocus: false,
                maxLength: 30,
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onTap: () {},
                style: TextStyle(color: Colors.black),
// controller: Controller,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@. ]'))
                ],

                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                        color: Color.fromRGBO(229, 229, 229, 1), width: 0.0),
                  ),
                  fillColor: Color.fromRGBO(229, 229, 229, 1),
                  filled: true,
                  counterText: '',
                  hintText: Constants.fullname,
                  prefixStyle: const TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please enter a Email address';
                  } else if (!Validator.isValidEmail(input)) {
                    return 'Please enter a valid Email address';
                  }
                  return null;
                },
                controller: emailController,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]'))
                ],
                cursorHeight: 20,
                autofocus: false,
                onTap: () {},
                maxLength: 50,
                style: TextStyle(color: Colors.black),
// controller: Controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                        color: Color.fromRGBO(229, 229, 229, 1), width: 0.0),
                  ),
                  fillColor: Color.fromRGBO(229, 229, 229, 1),
                  filled: true,
                  counterText: '',
                  hintText: Constants.email,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  // prefixIcon: Image(image: AssetImage('assets/mail.png')),

// suffixIcon: Container(
//     height: 10, width: 10, child: InkWell(onTap: () {})),
                  prefixStyle: const TextStyle(color: Colors.white),

                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                obscureText: _passVisibility,
                keyboardType: TextInputType.visiblePassword,
                maxLength: 16,
                cursorColor: Colors.black,
                // obscureText: hidden2,
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
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                        color: Color.fromRGBO(229, 229, 229, 1), width: 0.0),
                  ),
                  fillColor: Color.fromRGBO(229, 229, 229, 1),
                  filled: true,
                  hintText: Constants.password,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 30),
//               TextFormField(
//                 maxLength: 16,
//                 cursorColor: Colors.black,
//                 validator: (input) {
//                   if (input!.isEmpty) {
//                     return 'please Re enter Password';
//                   } else if (input.length < 6) {
//                     return 'please provide minimum 6 charters';
//                   } else if (input.length > 15) {
//                     return 'Password can not be greater than 15 characters';
//                   } else if (repasswordController.text !=
//                       passwordController.text) {
//                     return 'Password & Confirm Password should be same.';
//                   }
//                   return null;
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(
//                       RegExp(r"[a-zA-Z0-9!@#$%^&*.]")),
//                 ],
//                 controller: repasswordController,
//                 textInputAction: TextInputAction.next,
//                 obscureText: _passVisibility1,
//                 keyboardType: TextInputType.visiblePassword,
//                 cursorHeight: 20,
//                 autofocus: false,
//                 onTap: () {},
//                 style: TextStyle(color: Colors.black),
// // controller: Controller,
//                 decoration: InputDecoration(
//                   counterText: '',
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide:
//                           BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
//                   errorBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
//                   focusedErrorBorder: new OutlineInputBorder(
//                     borderSide: new BorderSide(
//                         color: Color.fromRGBO(229, 229, 229, 1), width: 0.0),
//                   ),
//                   fillColor: Color.fromRGBO(229, 229, 229, 1),
//                   filled: true,
//                   hintText: Constants.reenterpassword,
//                   suffixIcon: IconButton(
//                       onPressed: () {
//                         _passVisibility1 = !_passVisibility1;
//                         setState(() {});
//                       },
//                       icon: _passVisibility1
//                           ? Icon(
//                               Icons.visibility_off,
//                               color: Colors.grey,
//                             )
//                           : Icon(
//                               Icons.visibility,
//                               color: Colors.grey,
//                             )),
//                   prefixIcon: Icon(
//                     Icons.lock_outline,
//                     color: Colors.grey,
//                   ),
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.white, width: 2),
//                   ),
//                 ),
//               ),
              SizedBox(height: 30),
              // IntlPhoneField(
              //   decoration: InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10)),
              //         borderSide:
              //             BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide:
              //             BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
              //     errorBorder: OutlineInputBorder(
              //         borderSide:
              //             BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
              //     focusedErrorBorder: new OutlineInputBorder(
              //       borderSide: new BorderSide(
              //           color: Color.fromRGBO(229, 229, 229, 1), width: 0.0),
              //     ),
              //     fillColor: Color.fromRGBO(229, 229, 229, 1),
              //     filled: true,
              //     counterText: '',
              //     hintText: Constants.number,
              //     prefixStyle: const TextStyle(color: Colors.white),
              //     contentPadding:
              //         const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: const BorderSide(color: Colors.white, width: 2),
              //     ),
              //   ),
              //   onChanged: (phone) {
              //     print(phone.completeNumber);
              //   },
              //   showCountryFlag: false,
              //   // initialCountryCode: '+91',
              //   // initialValue: '+91',
              //   onCountryChanged: (country) {
              //     print(
              //       'Country changed to: ' + country.name,
              //     );
              //   },
              // ),
              SizedBox(height: 30),
//               TextFormField(
//                 cursorColor: Colors.black,
//                 textInputAction: TextInputAction.next,
//                 cursorHeight: 20,
//                 autofocus: false,
//                 maxLength: 200,
//                 maxLines: 5,
//                 // validator: (input) {
//                 //   if (input!.isEmpty) {
//                 //     return 'Please enter a Email address';
//                 //   }
//                 //   return null;
//                 // },
//                 onTap: () {},
//                 style: TextStyle(color: Colors.black),
// // controller: Controller,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.  ]'))
//                 ],
//
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide:
//                           BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
//                   errorBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Color.fromRGBO(229, 229, 229, 1))),
//                   focusedErrorBorder: new OutlineInputBorder(
//                     borderSide: new BorderSide(
//                         color: Color.fromRGBO(229, 229, 229, 1), width: 0.0),
//                   ),
//                   fillColor: Color.fromRGBO(229, 229, 229, 1),
//                   filled: true,
//                   counterText: '',
//                   hintText: Constants.address,
//                   prefixStyle: const TextStyle(color: Colors.white),
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Colors.white, width: 2),
//                   ),
//                 ),
//               ),
              SizedBox(
                height: Common.displayHeight(context) * 0.025,
              ),
              Row(
                children: [
                  Checkbox(
                      value: check,
                      shape: CircleBorder(),
                      checkColor: AppColors.bluenormal,
                      activeColor: AppColors.whitetext,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.whitetext),
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      }),
                  SizedBox(
                    width: Common.displayWidth(context) * 0.7,
                    child: RichText(
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      textScaleFactor: 1,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.whitetext,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'FuturaPTMedium'),
                          children: <TextSpan>[
                            TextSpan(
                              text: Constants.privacypolicy,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Provider.of<UserManagementProvider>(context, listen: false)
                      .checkUserProcess(
                    context,
                    emailController.text,
                    passwordController.text,
                    // countryCode,
                    // phoneController.text,
                  );

                },
                text: 'Signup',
              ),
              // CustomElevatedButton(
              //     onPressed: ()  {
              //      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OtpVerification()));
              //     },
              //     text: Constants.signup),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fullNameController.text, // John Doe
          // 'company': company, // Stokes and Sons
          // 'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
