

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AppSnacks{
 static showSnackBar(BuildContext context,
 {
   String message = "Success"
 } ){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  static showErrorToast(String message, bool _isSuccess){
    Fluttertoast.showToast(msg: message,backgroundColor: _isSuccess ? Colors.green :Colors.red ,fontSize: 20,gravity: ToastGravity.CENTER,textColor: Colors.white,toastLength: Toast.LENGTH_LONG);
  
}
}
//to show toast
