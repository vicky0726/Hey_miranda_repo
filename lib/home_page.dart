import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hey_miranda_repo/api/parms.dart';
import 'package:hey_miranda_repo/screens/main_screen.dart';
import 'package:hey_miranda_repo/screens/signup_screen.dart';
import 'package:hey_miranda_repo/utils/SharedPrefrence.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';

import 'api/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  @override
  void initState() {

    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Common.displayHeight(context) * 1,
        width: double.infinity,
        child: Stack(
          children: [
            Image(
              image: AssetImage('assets/images/first.png'),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 65,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ElevatedButton(onPressed: ()async{
                    //   await ApiServices.getAuthTokenApi();
                    //   print('out');
                    //   var authToken = await CustomPreferences.getPreferences(Params.auth_token);
                    //   print('Auth Token : $authToken');
                    // }, child: Text('click')),
                    CustomElevatedButton(
                      onPressed: () async{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainScreen()));

                      },
                      // {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => MainScreen()));
                      // },
                      text: Constants.areYouAPoliceOfficer,
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.03,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MainScreen()));
                        },
                        text: Constants.areYouAnAgency),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
