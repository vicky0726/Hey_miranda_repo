import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/miranda_main.dart';
import 'package:hey_miranda_repo/screens/profile_view.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.editProfile,
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
          child: Column(
            children: [
              SizedBox(
                height: Common.displayHeight(context) * 0.04,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage(
                    'assets/images/style.png',
                  ),
                  // AssetImage('assets/Avatar.png')
                ),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.02,
              ),
              Text(
                Constants.editProfilePic,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.greytext,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.offwhite,
                  ),
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
                            color: Color.fromRGBO(229, 229, 229, 1),
                            width: 0.0),
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
                ),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: Common.displayHeight(context) * 0.30,
                  width: Common.displayWidth(context) * 0.85,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.done,
                    cursorHeight: 20,
                    autofocus: false,
                    maxLength: 300,
                    maxLines: 7,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1))),
                      fillColor: Color.fromRGBO(229, 229, 229, 1),
                      filled: true,
                      counterText: '',
                      hintText: Constants.agencyBio,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: Common.displayHeight(context) * 0.09,
                  width: Common.displayWidth(context) * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: AppColors.lightblue,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => ProfileView()));
                    },
                    child: Text(
                      Constants.save,
                      style:
                          TextStyle(fontSize: 18, color: AppColors.whitetext),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
