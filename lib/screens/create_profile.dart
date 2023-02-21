import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_miranda_repo/screens/police_certificate.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final List<String> genderItems = [
    'police',
    'officer',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: Common.displayHeight(context) * 1.2,
        width: double.infinity,
        decoration: Common.commonBox(),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18,bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Common.displayHeight(context) * 0.1,
                ),
                Text(
                  Constants.createprofile,
                  style: TextStyle(
                      fontSize: 25,
                      color: AppColors.whitetext,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.04,
                ),
                Image(
                  image: AssetImage('assets/images/person.png'),
                  height: 80,
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.04,
                ),
                Text(
                  Constants.uploadprofilepic,
                  style: TextStyle(fontSize: 15, color: AppColors.whitetext),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.03,
                ),
                TextFormField(
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
                    hintText: Constants.fullname,
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
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                DropdownButtonFormField2(
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
                    prefixStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(
                      // vertical: 3,
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide:
                    //   const BorderSide(color: Colors.white, width: 2),
                    // ),
                  ),
                  // isExpanded: true,
                  hint: Text(
                    Constants.agencyname,
                    textAlign: TextAlign.start,
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    color: AppColors.offwhite,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select name.';
                    }
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 20,
                  autofocus: false,
                  maxLength: 30,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter a Email address';
                    }
                    return null;
                  },
                  onTap: () {},
                  style: TextStyle(color: Colors.black),
// controller: Controller,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.  ]'))
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
                    hintText: Constants.designation,
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
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                IntlPhoneField(
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
                    hintText: Constants.number,
                    prefixStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name,);
                  },
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 20,
                  autofocus: false,
                  maxLength: 30,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter a Email address';
                    }
                    return null;
                  },
                  onTap: () {},
                  style: TextStyle(color: Colors.black),
// controller: Controller,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.  ]'))
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
                    hintText: Constants.address,
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
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Flexible(
                        child:   Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: DropdownButtonFormField2(
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
                              prefixStyle: const TextStyle(color: Colors.white),
                              contentPadding: const EdgeInsets.symmetric(
                                // vertical: 3,
                              ),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              //   borderSide:
                              //   const BorderSide(color: Colors.white, width: 2),
                              // ),
                            ),
                            isExpanded: true,
                            hint: Text(
                              Constants.state,
                              textAlign: TextAlign.start,
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              color: AppColors.offwhite,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            items: genderItems
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select name.';
                              }
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: Flexible(
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButtonFormField2(
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
                              prefixStyle: const TextStyle(color: Colors.white),
                              contentPadding: const EdgeInsets.symmetric(
                                // vertical: 3,
                              ),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              //   borderSide:
                              //   const BorderSide(color: Colors.white, width: 2),
                              // ),
                            ),
                            isExpanded: true,
                            hint: Text(
                              Constants.country,
                              textAlign: TextAlign.start,
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              color: AppColors.offwhite,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            items: genderItems
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select name.';
                              }
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.04,
                ),
                CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PoliceCertificate()));
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
