import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/miranda_main.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';
class AgencyVerified extends StatefulWidget {
  const AgencyVerified({Key? key}) : super(key: key);

  @override
  State<AgencyVerified> createState() => _AgencyVerifiedState();
}

class _AgencyVerifiedState extends State<AgencyVerified> {
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
                image: AssetImage('assets/images/verified.png'),
                height: 110,
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.04,
              ),
              Text(
                Constants.agencyverified,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.whitetext,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.30,
              ),
              CustomElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MirandaMain()));
              }, text: Constants.continuekey)
            ],
          ),
        ),
      ),
    );
  }
}
