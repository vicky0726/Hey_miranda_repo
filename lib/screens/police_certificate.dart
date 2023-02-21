import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/verification_pending.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';

class PoliceCertificate extends StatefulWidget {
  const PoliceCertificate({Key? key}) : super(key: key);

  @override
  State<PoliceCertificate> createState() => _PoliceCertificateState();
}

class _PoliceCertificateState extends State<PoliceCertificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightblue1,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(
            child: Text(
              Constants.policeCertificate,
              style: TextStyle(
                fontSize: 25,
                color: AppColors.whitetext,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
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
                image: AssetImage('assets/images/certificate.png'),
                width: 110,
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.04,
              ),
              Text(
                Constants.uploadPoliceCertificate,
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.whitetext,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.2,
              ),
              Text(
                Constants.policeCertificatenote,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.whitetext,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Common.displayHeight(context) * 0.03,
              ),
              CustomElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VerificationPending()));
              }, text: Constants.continuekey)
            ],
          ),
        ),
      ),
    );
  }
}
