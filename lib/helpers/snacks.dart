

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class AppSnacks{
 static showSnackBar(BuildContext context,
 {
   String message = "Success"
 } ){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}