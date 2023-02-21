import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/models/Dummy_data.dart';
import 'package:hey_miranda_repo/screens/chat_screen.dart';
import 'package:hey_miranda_repo/screens/chat_view.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  List<FriendNames> findnameData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        findnameData.addAll(DummyData.friendname);
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                child: Image(
                  image: AssetImage('assets/images/comment.png'),
                  width: 30,
                ),
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: findnameData.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              margin: EdgeInsets.only(top: 1),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChatView(findnameData[index])),
                      );
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(
                          findnameData[index].image,
                        ),
                        // AssetImage('assets/Avatar.png')
                      ),
                      title: Row(
                        children: [
                          Text(
                            findnameData[index].name,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: Common.displayWidth(context) * 0.25,
                          ),
                          Text(
                            '7:02pm',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              findnameData[index].tegs,
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
