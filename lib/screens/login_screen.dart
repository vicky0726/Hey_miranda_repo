import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/screens/Welcome_screen.dart';
import 'package:hey_miranda_repo/screens/forgot_password.dart';
import 'package:hey_miranda_repo/screens/miranda_main.dart';
import 'package:hey_miranda_repo/screens/signup_screen.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/utils/validator.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
import 'package:hey_miranda_repo/widgets/custom_loder.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Widget contentBox(context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: Common.displayHeight(context) * 0.014),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: Common.displayHeight(context) * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'login succesfully',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                              height: Common.displayHeight(context) * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   width: Common.displayWidth(context) * 0.3,
                              //   height: Common.displayHeight(context) * 0.05,
                              //   // child: ElevatedButton(
                              //   //   style: ElevatedButton.styleFrom(
                              //   //     side: BorderSide(
                              //   //         width: 1, color: AppColors.lightblue10),
                              //   //     shape: RoundedRectangleBorder(
                              //   //         borderRadius:
                              //   //         BorderRadius.circular(10.0)),
                              //   //     backgroundColor: AppColors.whitetext,
                              //   //   ),
                              //   //   child: Text(
                              //   //     Constants.cancel,
                              //   //     style:
                              //   //     TextStyle(color: AppColors.lightblue10),
                              //   //   ),
                              //   //   onPressed: () {
                              //   //     Navigator.of(context).pop();
                              //   //   },
                              //   // ),
                              // ),
                              SizedBox(
                                width: Common.displayWidth(context) * 0.3,
                                height: Common.displayHeight(context) * 0.05,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0)),
                                    backgroundColor: AppColors.lightblue10,
                                  ),
                                  child: Text(
                                    'ok',
                                    style:
                                    TextStyle(color: AppColors.whitetext),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MirandaMain()),
                                            (Route<dynamic> route) => false);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: Common.displayHeight(context) * 0.014),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passVisibility = true;
  var formKey = GlobalKey<FormState>();
Future fetchdata() async {
  var headers = {
    'Authorization': 'Basic aGV5X21pcmFuZGE6MFU5dzg0YXoxeUhDWDMyVFhhekw='
  };
  var request = http.MultipartRequest('POST', Uri.parse('https://demo.dev9server.com/hey-miranda/api/access-token'));
  request.fields.addAll({
    'access_token': 'access_heymiranda_token'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
  print(response.reasonPhrase);
  }

}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.next,
            cursorHeight: 20,
            autofocus: false,
            maxLength: 30,
            validator: (input) {
              if (input!.isEmpty) {
                return 'Please enter a Email address';
              } else if (!Validator.isValidEmail(input)) {
                return 'Please enter a valid Email address';
              }
              return null;
            },
            onTap: () {},
            style: TextStyle(color: Colors.black),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]'))
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
              hintText: Constants.email,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey,
              ),
              prefixStyle: const TextStyle(color: Colors.white),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r"[a-zA-Z0-9!@#$%^&*.]")),
            ],
            controller: passwordController,
            textInputAction: TextInputAction.done,
            validator: (input) {
              if (input!.isEmpty) {
                return 'please type Password';
              } else if (input.length < 6) {
                return 'please provide minimum 6 charters';
              } else if (input.length > 15) {
                return 'Password can not be greater than 15 characters';
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
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),
              fillColor: Color.fromRGBO(229, 229, 229, 1),
              filled: true,
              hintText: Constants.password,
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
              counterText: '',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              prefixStyle: const TextStyle(color: Colors.white),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          SizedBox(
            height: Common.displayHeight(context) * 0.15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ForgotPassword()));
            },
            child: Text(
              Constants.forgotpassword,
              style: TextStyle(
                  color: AppColors.lightblue11,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Basic Sans SF Regular'),
            ),
          ),
          SizedBox(
            height: Common.displayHeight(context) * 0.04,
          ),
          CustomElevatedButton(
            onPressed: (){
              Provider.of<UserManagementProvider>(context,listen:false).loginProcess(context, emailController.text, passwordController.text);
            },
              // onPressed: () async {
              //  await fetchdata();
              // },
              text: Constants.login),




                ////  firebase /////////
                // dialogLoader(context);
                //
                // UserCredential user = await FirebaseAuth.instance
                //     .signInWithEmailAndPassword(
                //     email: emailController.text,
                //     password: passwordController.text);
                // if (user.user == null) {
                //   Navigator.pop(context);
                //   print('Hi' + 'error ${user.user.toString()}');
                //   // Common.showSnackBar(error.toString(), context);
                // } else {
                //   Navigator.pop(context);
                //   print('login sucess');
                //   showDialog(
                //     context: context,
                //     builder: (context) {
                //       return Dialog(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //         elevation: 0,
                //         //backgroundColor: Colors.black,
                //         child: contentBox(context),
                //       );
                //     },
                //   );
                // }
    //       CustomElevatedButton(
    //           onPressed: () async {
    //             dialogLoader(context);
    //             UserCredential user = await FirebaseAuth.instance
    //                 .signInWithEmailAndPassword(
    //                 email: emailController.text,
    //                 password: passwordController.text);
    //                if (user.user == null) {
    //               Navigator.pop(context);
    //             print( 'error ${user.user.toString()}');
    // // Common.showSnackBar(error.toString(), context);
    //                  }
    // else {
    // Navigator.pop(context);
    // print('created New Account');
    // showDialog(
    // context: context,
    // builder: (context) {
    // // Future.delayed(Duration(seconds: 5),(){
    // //   Navigator.of(context).pop(true);
    // // });
    // return Dialog(
    // shape: RoundedRectangleBorder(
    // borderRadius: BorderRadius.circular(30),
    // ),
    // elevation: 0,
    // //backgroundColor: Colors.black,
    // child: contentBox(context),
    // );
    // },
    // );
    // },
    // , text: '';,)

              //          if (user.user == null) {
              //          Navigator.pop(context);
              //       .then((value) {
              //     print('login succes');
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         // Future.delayed(Duration(seconds: 5),(){
              //         //   Navigator.of(context).pop(true);
              //         // });
              //         return Dialog(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(30),
              //           ),
              //           elevation: 0,
              //           //backgroundColor: Colors.black,
              //           child: contentBox(context),
              //         );
              //       },
              //     );
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => WelcomeScreen()));
              //   }).onError((error, stackTrace) {
              //     print('error ${error.toString()}');
              //   });
              //   // if (formkey.currentState!.validate()) {
              //   //   Navigator.of(context).push(MaterialPageRoute(
              //   //       builder: (context) => OtpVerification()));
              //   // }
              // },
              // onPressed: () {
              //   FirebaseAuth.instance
              //       .signInWithEmailAndPassword(
              //           email: emailController.text,
              //           password: passwordController.text)
              //       .then((value) {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => WelcomeScreen()));
              //   }).onError((error, stackTrace) {
              //     print('Error ${error.toString()}');
              //   });
              //   // if (formKey.currentState!.validate()) {
              //   //   Navigator.of(context).push(
              //   //       MaterialPageRoute(builder: (context) => MirandaMain()));
              //   // }
              // }
        ]),
      ),
    );
  }
}
