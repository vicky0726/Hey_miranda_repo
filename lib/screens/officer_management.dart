import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/screens/officer_list.dart';
import 'package:hey_miranda_repo/screens/officer_request.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';
import 'package:hey_miranda_repo/utils/constants.dart';

class OfficerManagement extends StatefulWidget {
  const OfficerManagement({Key? key}) : super(key: key);

  @override
  State<OfficerManagement> createState() => _OfficerManagementState();
}

class _OfficerManagementState extends State<OfficerManagement>
    with SingleTickerProviderStateMixin {
  // int tabNumber = 0;

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightblue1,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(
            child: Text(
              Constants.officerManagement,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.whitetext,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: Common.displayHeight(context),
        width: Common.displayWidth(context),padding: EdgeInsets.only(top: 10),
        color: AppColors.whitetext,
        child: Column(
          children: [
            Container(
              height: Common.displayHeight(context) * 0.08,
              width: Common.displayWidth(context) * 0.9,
              // padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: AppColors.lightblue),
              ),
              child: DefaultTabController(
                length: 2,
                initialIndex: 1,
                child: TabBar(
                  controller: tabController,
                  onTap: (value) {
                    if (kDebugMode) {
                      print(tabController!.index.toString());
                    }
                    setState(() {});
                  },
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: tabController!.index == 0
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))
                        : const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                    color: AppColors.lightblue,
                    // border: Border.all(color: AppColors.red,width: 01),
                  ),
                  labelColor: AppColors.whitetext,
                  unselectedLabelColor: AppColors.lightblue,

                  tabs: const [

                    Tab(
                      child: Text(Constants.officerRequest),
                      // text: Constants.officerRequest,
                    ),
                    Tab(
                      child: Text(Constants.officerList),
                      // text: Constants.officerList,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,

                physics: const NeverScrollableScrollPhysics(),
                children: [
                  OfficerRequest(),
                  OfficerList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
