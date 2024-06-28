import 'package:divine_pooja/constants/constants.dart';
import 'package:flutter/material.dart';



void successToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(msg,style: TextStyle(
        color: Colors.black,
      ),),
      backgroundColor: Colors.green,
      margin: const EdgeInsets.only(top: 70, left: 10, right: 10), // Adjust margin as needed
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void errorToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(msg,style: TextStyle(
        color:  Colors.white,
      ),),
      backgroundColor: Colors.red,
      margin: const EdgeInsets.only(top: 70, left: 10, right: 10), // Adjust margin as needed
      behavior: SnackBarBehavior.floating,
    ),
  );
}


void showProgress(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: mainColor.withOpacity(0.25),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      );
    },
  );
}

void closeProgress(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
