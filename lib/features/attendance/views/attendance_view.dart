import 'package:flutter/material.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({ Key? key }) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
      ),
      
    );
  }
}