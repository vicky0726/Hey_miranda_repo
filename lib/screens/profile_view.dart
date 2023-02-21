import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/screens/about_us.dart';
import 'package:hey_miranda_repo/screens/change_password.dart';
import 'package:hey_miranda_repo/screens/edit_profile.dart';
import 'package:hey_miranda_repo/screens/home_view.dart';
import 'package:hey_miranda_repo/screens/login_screen.dart';
import 'package:hey_miranda_repo/screens/main_screen.dart';
import 'package:hey_miranda_repo/screens/officer_management.dart';
import 'package:hey_miranda_repo/screens/privacy_policy.dart';
import 'package:hey_miranda_repo/screens/terms_condition.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
                              'Are Your Sure you want to\n Delete this Account?',
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: Common.displayWidth(context) * 0.3,
                                height: Common.displayHeight(context) * 0.05,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1, color: AppColors.lightblue10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    backgroundColor: AppColors.whitetext,
                                  ),
                                  child: Text(
                                    Constants.cancel,
                                    style:
                                        TextStyle(color: AppColors.lightblue10),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
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
                                    Constants.sure,
                                    style:
                                        TextStyle(color: AppColors.whitetext),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => MainScreen()),
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

  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(
          image: AssetImage('assets/images/logo.png'),
          height: 50,
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23,right: 23),
              child: Row(
                children: [
                  Container(
                      width: Common.displayWidth(context) * 0.23,
                      height: Common.displayHeight(context) * 0.12,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/girl.png'),
                              scale: 4))),
                  Container(
                    margin: const EdgeInsets.only( left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: Common.displayHeight(context) * 0.04,
                          child: const Text(
                            Constants.hiAgencyName,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                         Text(
                          Constants.personGmailCom,
                          style: TextStyle(
                              fontSize: 14, ),
                        ),
                        SizedBox(height: Common.displayHeight(context) * 0.01,),
                        Container(
                          height: Common.displayHeight(context) * 0.05,
                          // width: Common.displayWidth(context) * 0.25,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                backgroundColor: AppColors.lightblue,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                              },
                              child: Text(Constants.editProfile)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // ListTile(
            //   title: Padding(
            //     padding: const EdgeInsets.only(
            //       right: 70,
            //     ),
            //     child: Column(
            //       children: [
            //         Text(
            //           Constants.hiAgencyName,
            //           style: TextStyle(
            //               fontSize: 16,
            //               color: Colors.black,
            //               fontWeight: FontWeight.w600),
            //         ),
            //         SizedBox(
            //           height: Common.displayHeight(context) * 0.01,
            //         ),
            //         Text(
            //           Constants.personGmailCom,
            //           style: TextStyle(
            //             fontSize: 14,
            //             color: AppColors.greytext,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //         SizedBox(
            //           height: Common.displayHeight(context) * 0.01,
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 20),
            //           child: ElevatedButton(
            //               style: ElevatedButton.styleFrom(
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(5.0)),
            //                 backgroundColor: AppColors.lightblue,
            //               ),
            //               onPressed: () {
            //                 Navigator.of(context).push(MaterialPageRoute(
            //                     builder: (context) => EditProfile()));
            //               },
            //               child: Text(Constants.editProfile)),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      Constants.notificationSettings,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    trailing: CupertinoSwitch(
                        value: switchValue,
                        activeColor: CupertinoColors.activeBlue,
                        onChanged: (bool? value) {
                          setState(() {
                            switchValue = value ?? false;
                          });
                        }),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {},
                        leading: Text(
                          Constants.myNotes,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OfficerManagement()));
                        },
                        leading: Text(
                          Constants.officerManagement,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangePassword()));
                        },
                        leading: Text(
                          Constants.changePassword,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PrivacyPolicy()));
                        },
                        leading: Text(
                          Constants.privacyPolicy,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TermaCondition()));
                        },
                        leading: Text(
                          Constants.termsConditions,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutUs()));
                        },
                        leading: Text(
                          Constants.aboutUs,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0,
                                //backgroundColor: Colors.black,
                                child: contentBox(context),
                              );
                            },
                          );
                        },
                        leading: Text(
                          Constants.deleteAccount,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                  SizedBox(
                    height: Common.displayHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ListTile(
                        onTap: () {
                          Provider.of<UserManagementProvider>(context, listen: false).logoutProcess(context,);
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) => MainScreen()),
                          //     (Route<dynamic> route) => false);
                        },
                        leading: Text(
                          Constants.logout,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        trailing: Image(
                          image: AssetImage('assets/images/arrow.png'),
                          height: 20,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
