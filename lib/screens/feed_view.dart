import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/models/Dummy_data.dart';
import 'package:hey_miranda_repo/screens/new_post.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  List<UserNames> findnameData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        findnameData.addAll(DummyData1.username);
      });
    });
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewPost()));
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: findnameData.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              margin: EdgeInsets.only(top: 1),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Common.displayWidth(context) * 0.001,
                            ),
                            CircleAvatar(
                              radius: 16.0,
                              backgroundImage: AssetImage(
                                findnameData[index].image,
                              ),
                              // AssetImage('assets/Avatar.png')
                            ),
                            SizedBox(
                              width: Common.displayWidth(context) * 0.08,
                            ),
                            Text(
                              findnameData[index].name,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: Common.displayWidth(context) * 0.35,
                            ),
                            Text(
                              '3m ago',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Common.displayHeight(context) * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              findnameData[index].tegs,
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
