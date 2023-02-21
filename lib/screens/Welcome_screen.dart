import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/main_screen.dart';
import 'package:hey_miranda_repo/screens/messages_view.dart';
import 'package:hey_miranda_repo/screens/miranda_main.dart';
import 'package:hey_miranda_repo/screens/profile_view.dart';
import 'package:hey_miranda_repo/screens/signup_screen.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final database = FirebaseDatabase.instance.reference();
  final user = FirebaseAuth.instance.currentUser!;

  TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     // builder: (context) => AddNamePage(),
              //   ),
              // )
            }, child: Icon(Icons.add))
        ],
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back, color: Colors.black),
        //     onPressed: () => Navigator.of(context).pushAndRemoveUntil(
        //         MaterialPageRoute(builder: (context) => MainScreen()),
        //         (Route<dynamic> route) => false)),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('signed in as: ' + user.email!,
                  style: TextStyle(fontSize: 20),),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        print('Signed out');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MainScreen()),
                                (Route<dynamic> route) => false);
                      });
                    },
                    child: Text('logout'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MirandaMain()));
                  //   },
                  //   child: Text('home'),
                  // ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileView()));
            //   },
            //   child: Text('profile'),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         FirebaseAuth.instance.signOut().then((value) {
            //           print('Signed out');
            //           Navigator.of(context).pop();
            //         });
            //       },
            //       child: Text('logout'),
            //     ),
            //     SizedBox(
            //       width: 80,
            //     ),
            //     // ElevatedButton(
            //     //   onPressed: () {
            //     //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MessagesView()));
            //     //   },
            //     //   child: Text('show us'),
            //     // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
