import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils{
  static void showLoading(BuildContext context, {bool dismissible = true}){
    showDialog(
        barrierDismissible: dismissible,
        context: context, builder: (context)=> PopScope(
      canPop: dismissible,
      child: CupertinoAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: CircularProgressIndicator(),),
          ],
        ),
      ),
    ));
  }

  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }

static  void showToastMessage({required String message, required Color bgColor, required Color fgColor}){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:bgColor,
        textColor: fgColor,
        fontSize: 16.0
    );
  }
}