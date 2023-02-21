import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.privacyPolicy,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
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
              Text(
                  textAlign: TextAlign.start,
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus euismod. Dictum fusce ut placerat orci nulla'),
              SizedBox(
                height: Common.displayHeight(context) * 0.02,
              ),
              Text(
                  'Tincidunt ornare massa eget egestas purus viverra accumsan in nisl. Tempor id eu nisl nunc mi ipsum faucibus. Fusce id velit ut tortor pretium. Massa ultricies mi quis hendrerit dolor magna eget. Nullam eget felis eget nunc lobortis. Faucibus ornare suspendisse sed nisi.'),
              SizedBox(
                height: Common.displayHeight(context) * 0.02,
              ),
              Text(
                  'Sagittis eu volutpat odio facilisis mauris sit amet massa. Erat velit scelerisque in dictum non consectetur a erat. Amet nulla facilisi morbi tempus iaculis urna. Egestas purus viverra accumsan in nisl. Feugiat in ante metus dictum at tempor commodo. Convallis tellus id interdum velit laoreet. Proin sagittis nisl rhoncus mattis rhoncus urna neque viverra. Viverra aliquet eget sit amet tellus cras adipiscing enim eu. Ut faucibus pulvinar elementum integer enim neque volutpat'),
            ],
          ),
        ),
      ),
    );
  }
}
