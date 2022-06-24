import 'package:flutter/material.dart';

class DashboardDataView extends StatefulWidget {
  const DashboardDataView({ Key? key }) : super(key: key);

  @override
  State<DashboardDataView> createState() => _DashboardDataViewState();
}

class _DashboardDataViewState extends State<DashboardDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Data"),
      ),
      
    );
  }
}