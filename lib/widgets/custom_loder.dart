import 'package:flutter/material.dart';

dialogLoader(context){
  showDialog(
    context: context,
    builder: (context) {
      return const Center(child: CircularProgressIndicator());
    },
  );
}