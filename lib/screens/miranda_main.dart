import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/feed_view.dart';
import 'package:hey_miranda_repo/screens/home_view.dart';
import 'package:hey_miranda_repo/screens/messages_view.dart';
import 'package:hey_miranda_repo/screens/profile_view.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class MirandaMain extends StatefulWidget {
  const MirandaMain({Key? key}) : super(key: key);

  @override
  State<MirandaMain> createState() => _MirandaMainState();
}

class _MirandaMainState extends State<MirandaMain> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    FeedView(),
    MessagesView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var iconSize = screenWidth / 10;

    return Scaffold(
      body: Center(
        child: _children.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightblue1, AppColors.blacklight],
            begin: FractionalOffset(2.8, 0.0),
            end: FractionalOffset(5.0, 10.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          unselectedFontSize: 10,
          unselectedItemColor: AppColors.darkgrey,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: Image(
                    color: AppColors.whitetext,
                    image: AssetImage('assets/images/home.png'),
                    height: 23),
                icon: Image(
                    color: AppColors.darkgrey,
                    image: AssetImage('assets/images/home.png'),
                    height: 23),
                label: (Constants.home),
                backgroundColor: AppColors.greyborder),
            BottomNavigationBarItem(
              icon: Image(
                  color: AppColors.darkgrey,
                  image: AssetImage('assets/images/feed.png'),
                  height: 23),
              activeIcon: Image(
                  color: AppColors.whitetext,
                  image: AssetImage('assets/images/feed.png'),
                  height: 23),
              label: (Constants.feed),
            ),
            BottomNavigationBarItem(
              icon: Image(
                  color: AppColors.darkgrey,
                  image: AssetImage('assets/images/messages.png'),
                  height: 23),
              activeIcon: Image(
                  color: AppColors.whitetext,
                  image: AssetImage('assets/images/messages.png'),
                  height: 23),
              label: (Constants.messages),
            ),
            BottomNavigationBarItem(
              icon: Image(
                  color: AppColors.darkgrey,
                  image: AssetImage('assets/images/PROFILEpng.png'),
                  height: 23),
              activeIcon: Image(
                  color: AppColors.whitetext,
                  image: AssetImage('assets/images/PROFILEpng.png'),
                  height: 23),
              label: (Constants.profile),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.whitetext,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          iconSize: iconSize,
        ),
      ),
    );
  }
}
