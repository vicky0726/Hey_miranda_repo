import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/utils/app_colors.dart';
import 'package:hey_miranda_repo/utils/common.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const   CustomElevatedButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Common.displayHeight(context) * 0.09,
      width: Common.displayWidth(context) * 0.9,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          backgroundColor: AppColors.darkblue,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Basic Sans SF Regular',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
