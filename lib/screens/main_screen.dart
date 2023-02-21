import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/login_screen.dart';
import 'package:hey_miranda_repo/screens/signup_screen.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tabNumber = 0;

  @override
  void initState() {
    apiCalling();
    super.initState();
  }

  apiCalling() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightblue1,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Common.displayHeight(context) * 1,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [AppColors.lightblue1, AppColors.blacklight],
            begin: FractionalOffset(0.8, 0.0),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
          child: Column(
            children: [
              SizedBox(
                height: Common.displayHeight(context) * 0.01,
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: Common.displayHeight(context) * 0.2,
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70.0),
                          child: TabBar(
                            onTap: (val) {
                              setState(() {
                                tabNumber = val;
                              });
                            },
                            labelPadding: EdgeInsets.symmetric(horizontal: 10),
                            indicatorPadding: EdgeInsets.zero,
                            indicatorColor: Colors.white,
                            unselectedLabelColor: Colors.white,
                            labelColor: Colors.white,
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Text(
                                Constants.logincap,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                Constants.signupCap,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: TabBarView(
                                children: [LoginScreen(), SignUpScreen()]))
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
