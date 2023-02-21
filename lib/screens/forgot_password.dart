import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/screens/reset_password.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/utils/validator.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

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
          child: Column(
            children: [
              Text(
                Constants.forgotpasswordkey,
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.whitetext,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Basic Sans SF Regular',
                ),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.04,
              ),
              Text(Constants.enteremail,
                  style: TextStyle(
                    color: AppColors.whitetext,
                    fontSize: 14,
                    fontFamily: 'Basic Sans SF Regular',
                  ),
                  textAlign: TextAlign.center),
              SizedBox(
                height: Common.displayHeight(context) * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFormField(
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
// controller: Controller,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]'))
                  ],

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

// suffixIcon: Container(
//     height: 10, width: 10, child: InkWell(onTap: () {})),
                    prefixStyle: const TextStyle(color: Colors.white),

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
                height: Common.displayHeight(context) * 0.3,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      onPressed: () {
                        Provider.of<UserManagementProvider>(context,
                                listen: false)
                            .forgotPasswordProcess(
                                context, emailController.text);
                      },
                      text: Constants.sendcode)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
