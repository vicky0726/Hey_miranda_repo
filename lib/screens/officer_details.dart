import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/officer_list.dart';
import 'package:hey_miranda_repo/screens/officer_management.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';

class OfficerDetails extends StatefulWidget {
  const OfficerDetails({Key? key}) : super(key: key);

  @override
  State<OfficerDetails> createState() => _OfficerDetailsState();
}

class _OfficerDetailsState extends State<OfficerDetails> {
  bool notificationValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: AppBar(
              title: Text(
                Constants.officerManagement,
                style: TextStyle(fontSize: 20),
              ),
              flexibleSpace: Container(
                decoration: Common.commonBox(),
              ),
              elevation: 0,
              // centerTitle: true,
            )),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                left: 28.0,
                top: 20,
                right: 28.0,
              ),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: Common.displayHeight(context) * 0.04,
                                child: const Text(
                                  "Allie Grater",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Text(
                                "Designation",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Police Id: 525 112",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.03,
                    ),
                    const Text(
                      "Contact Details",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.01,
                    ),
                    Container(
                      // height: Common.displayHeight(context) * 0.12,
                      width: Common.displayWidth(context),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyborder,
                            //                   <--- border color
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Phone Number: (207) 555-0119',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email Id: Alliegrater@Gmail.Com',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.03,
                    ),
                    const Text(
                      "Address",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.01,
                    ),
                    Container(
                      height: Common.displayHeight(context) * 0.12,
                      width: Common.displayWidth(context),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyborder,
                            //                   <--- border color
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Text(
                        '2972 Westheimer Rd. Santa Ana, Illinois 85486 New York, US',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.03,
                    ),
                    const Text(
                      "Certificate",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.01,
                    ),
                    Container(
                      height: Common.displayHeight(context) * 0.12,
                      width: Common.displayWidth(context),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyborder,
                            //                   <--- border color
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.photo_library_outlined,
                            size: 32,
                          ),
                          Text(
                            "Certificate Name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 80,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: AppColors.lightblue,
                                ),
                                onPressed: () {},
                                child: Text(Constants.view)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: Common.displayHeight(context) * 0.06,
                          width: Common.displayWidth(context) * 0.38,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 1.2,
                                color: AppColors.lightblue,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: AppColors.whitetext,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              Constants.deny,
                              style: TextStyle(
                                  color: AppColors.lightblue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          height: Common.displayHeight(context) * 0.06,
                          width: Common.displayWidth(context) * 0.38,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 1.0,
                                color: AppColors.lightblue,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: AppColors.lightblue,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OfficerManagement()));
                            },
                            child: Text(
                              Constants.approve,
                              style: TextStyle(
                                  color: AppColors.whitetext,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    )
                  ])),
        ));
  }
}
