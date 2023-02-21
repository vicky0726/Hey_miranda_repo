import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/models/Dummy_data.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class ChatView extends StatefulWidget {
  const ChatView(FriendNames findnameData, {Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _messages = <String>[];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightblue1,
        // leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/style.png'),
              radius: 22,
            ),
            SizedBox(
              width: 13,
            ),
            Text(
              Constants.personsName,
              style: TextStyle(
                  color: AppColors.whitetext,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        // centerTitle: true,
        // flexibleSpace: Container(
        //   decoration: Common.commonBox(),
        // ),
        // elevation: 0,
        // leadingWidth: 30,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
                child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200, top: 10),
                  child: Container(
                    width: 120,
                    height: 29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.darkblue9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hey There!',
                        style:
                            TextStyle(color: AppColors.whitetext, fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 120),
                    child: Text(
                      "7:02 PM",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: Container(
                    width: 120,
                    height: 29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(77, 77, 77, 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hey There!',
                        style:
                            TextStyle(color: AppColors.whitetext, fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 280),
                    child: Text(
                      "7:02 PM",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
              )),
          Container(
            height: Common.displayHeight(context) * 0.1,
            width: Common.displayWidth(context) * 1,
            color: AppColors.keybord,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: AppColors.black,
                    size: 28,
                  ),
                  SizedBox(
                    width: Common.displayWidth(context) * 0.04,
                  ),
                  SizedBox(
                    width: Common.displayWidth(context) * 0.65,
                    height: Common.displayHeight(context) * 0.05,
                    child: TextFormField(
                      cursorHeight: 10,
                      autofocus: false,
                      onTap: () {},
                      style: TextStyle(color: AppColors.black),
                      // controller: Controller,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Type message here..",
                        hintStyle: TextStyle(fontSize: 10),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Common.displayWidth(context) * 0.04,
                  ),
                  Icon(
                    Icons.share,
                    color: AppColors.black,
                    size: 28,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
