import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              children: [
                SizedBox(
                  height: Common.displayHeight(context) * 0.05,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.black,
                    cursorHeight: 20,
                    autofocus: false,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
// controller: Controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: AppColors.whitetext)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1))),
                      fillColor: AppColors.whitetext,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.black,
                      ),
                      hintText: Constants.search,
                      suffixIcon: Icon(Icons.close),
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 10),
                    ),
                  ),
                ),
                SizedBox(
                  height: Common.displayHeight(context) * 0.10,
                ),
                Image(image: AssetImage('assets/images/sound.png')),
                SizedBox(
                  height: Common.displayHeight(context) * 0.02,
                ),
                Text(
                  Constants.askquestion,
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
