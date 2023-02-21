import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/screens/create_profile.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpVerification extends StatefulWidget {
  final String otp;
  final String email;
  final String password;

  OtpVerification({Key? key, required this.otp,required this.email , required this.password}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController otpcontroller = TextEditingController();
  String otpvalue = "";
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Common.displayHeight(context) * 1,
          width: double.infinity,
          decoration: Common.commonBox(),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: Common.displayHeight(context) * 0.15,
                ),
                Text(
                  Constants.stepverification,
                  style: TextStyle(
                      fontSize: 25,
                      color: AppColors.whitetext,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.06,
                ),
                Text(
                  Constants.codeverification,
                  style: TextStyle(fontSize: 14, color: AppColors.whitetext),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PinCodeTextField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please enter otp';
                      }
                      return null;
                    },
                    cursorHeight: 19,
                    enablePinAutofill: true,
                    controller: otpcontroller,
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    length: 6,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 55,
                      fieldWidth: 45,
                      inactiveColor: AppColors.whitetext,
                      errorBorderColor: AppColors.whitetext,
                      selectedColor: AppColors.whitetext,
                      activeFillColor: AppColors.whitetext,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.whitetext,
                      // inactiveFillColor: Colors.black,
                      borderWidth: 1,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: false,
                    onChanged: (value) {},
                    appContext: context,
                  ),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.20,
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
                      if (widget.otp == otpcontroller.text) {
                        Provider.of<UserManagementProvider>(context, listen: false)
                            .signUpProcess(
                          context,
                          widget.email,
                          widget.password,
                          widget.otp
                          // countryCode,
                          // phoneController.text,
                        );
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => CreateProfile()));
                      }
                      else {
                        Common.showSnackBar('your otp is not correct', context);
                      }
                      // if (formkey.currentState!.validate()) {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => CreateProfile()));
                      // }
                    },
                    text: Constants.continuekey)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
