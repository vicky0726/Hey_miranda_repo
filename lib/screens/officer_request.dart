import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/models/Dummy_data.dart';
import 'package:hey_miranda_repo/screens/officer_details.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';

class OfficerRequest extends StatefulWidget {
  const OfficerRequest({Key? key}) : super(key: key);

  @override
  State<OfficerRequest> createState() => _OfficerRequestState();
}

class _OfficerRequestState extends State<OfficerRequest> {
  List<OfficerName> findnameData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        findnameData.addAll(DummyData3.officername);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: findnameData.length,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 18,right: 18),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 30.0,
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
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12,
                      children: [
                        Image(
                          image: AssetImage('assets/images/wrong.png'),
                          height: 40,
                        ),
                        Image(
                          image: AssetImage('assets/images/right.png'),
                          height: 40,
                        )
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OfficerDetails()));
                            },
                            child: Text(
                              findnameData[index].tegs,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: AppColors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  color: AppColors.greyborder,
                ),
              ],
            );
          }),
    );
  }
}
