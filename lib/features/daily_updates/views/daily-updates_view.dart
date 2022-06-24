import 'package:flutter/material.dart';

class DailyUpdatesView extends StatefulWidget {
  const DailyUpdatesView({ Key? key }) : super(key: key);

  @override
  State<DailyUpdatesView> createState() => _DailyUpdatesViewState();
}

class _DailyUpdatesViewState extends State<DailyUpdatesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Updates"),
      ),
      
    );
  }
}