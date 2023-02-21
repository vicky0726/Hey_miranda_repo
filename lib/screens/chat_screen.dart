import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.startNewChat,
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
        child: Column(
          children: [
            SizedBox(
              height: 20,
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
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    fillColor: AppColors.offwhite,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    Constants.agencyname,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'FuturaPTMedium'),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    color: AppColors.offwhite,
                    borderRadius: BorderRadius.circular(10),
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
              height: 20,
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: AppColors.greyborder,
            ),
            SizedBox(
              height: Common.displayHeight(context) * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constants.personsName,
                          style: TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage('assets/images/style.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constants.personsName,
                          style: TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage('assets/images/style.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constants.personsName,
                          style: TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage('assets/images/style.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constants.personsName,
                          style: TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage('assets/images/style.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constants.personsName,
                          style: TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage('assets/images/style.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constants.personsName,
                          style: TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage('assets/images/style.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constants.personsName,
                          style: TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage('assets/images/style.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Common.displayHeight(context) * 0.02,
            ),
            CustomElevatedButton(
                onPressed: () {}, text: Constants.chatwithAgency),
            SizedBox(
              height: Common.displayHeight(context) * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
