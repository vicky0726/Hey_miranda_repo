import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/agency_verified.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';

class VerificationPending extends StatefulWidget {
  const VerificationPending({Key? key}) : super(key: key);

  @override
  State<VerificationPending> createState() => _VerificationPendingState();
}

class _VerificationPendingState extends State<VerificationPending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Common.displayHeight(context) * 1,
          width: double.infinity,
          decoration: Common.commonBox(),
          child: Column(
            children: [
              SizedBox(
                height: Common.displayHeight(context) * 0.30,
              ),
              Image(
                image: AssetImage('assets/images/pending.png'),
                height: 110,
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.04,
              ),
              Text(
                Constants.verificationPending,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.whitetext,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.30,
              ),
              CustomElevatedButton(
                  onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AgencyVerified()));
                  }, text: Constants.continuekey)
            ],
          ),
        ),
      ),
    );
  }
}
