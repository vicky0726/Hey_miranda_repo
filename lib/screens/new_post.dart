import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';
import 'package:hey_miranda_repo/widgets/custom_elevated_button.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.newPost),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: Common.commonBox(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: Common.displayHeight(context) * 0.30,
                width: Common.displayWidth(context) * 0.85,
                child: TextFormField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  cursorHeight: 20,
                  autofocus: false,
                  maxLength: 50,
                  maxLines: 8,
                  onTap: () {},
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.lightgrey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.greyborder)),
                    fillColor: AppColors.whitetext,
                    filled: true,
                    counterText: '',
                    hintText: Constants.typePostCaption,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.offwhite,
                ),
                height: Common.displayHeight(context) * 0.28,
                width: Common.displayWidth(context) * 0.86,
                child: Column(
                  children: [
                    SizedBox(
                      height: Common.displayHeight(context) * 0.09,
                    ),
                    Image(
                      image: AssetImage('assets/images/photo-video.png'),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.02,
                    ),
                    Text(
                      Constants.uploadPhotoVideo,
                      style: TextStyle(fontSize: 16, color: AppColors.black),
                    ),
                    SizedBox(
                      height: Common.displayHeight(context) * 0.02,
                    ),
                    Text(
                      '(Optional)',
                      style: TextStyle(color: AppColors.greyborder, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Common.displayHeight(context) * 0.12,
            ),
            CustomElevatedButton(onPressed: () {}, text: Constants.post)
          ],
        ),
      ),
    );
  }
}
