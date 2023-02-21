import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';



class Common {
  static double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static commonBox() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.lightblue1, AppColors.blacklight],
        begin: FractionalOffset(0.8, 0.0),
        end: FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    );
  }
}


class Common1 {
  //=============== Snack Bar ===============================
  static showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  //Show loading dialog
  static showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Dialog(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 40.0,
                        // width: 40.0,
                        child:
                        //Platform.isIOS
                        // ?
                        CupertinoActivityIndicator(
                          radius: 10,
                          color: Colors.black,
                          animating: true,
                        )
                      // :
                      // commonLoader(context),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Please Wait...',
                        style: TextStyle(
                            color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  //Hide loading dialog
  static hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}


