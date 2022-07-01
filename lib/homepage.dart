import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/constants/app_constants.dart';
import 'package:testapp/features/attendance/views/attendance_view.dart';
import 'package:testapp/features/daily_updates/views/daily-updates_view.dart';
import 'package:testapp/features/dashboard/views/dashboard_view.dart';
import 'package:testapp/features/leaves/views/leaves_view.dart';
import 'package:testapp/features/profile/views/profile_view.dart';
import 'package:testapp/home.dart';
import 'package:testapp/injector.dart';
import 'package:testapp/providers/counter_provider.dart';

class HomePage extends StatefulWidget {
  

  const HomePage({Key? key, })
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<Widget> pages = [
  DashboardView(),
  DailyUpdatesView(),
  AttendanceView(),
  LeavesView(),
  ProfileView()
];

int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    

    return WillPopScope(
      onWillPop:() async{
        if(_currentIndex == 0){
          SystemNavigator.pop();

        }else{
          setState(() {
            _currentIndex = 0;
          });
        }
        
        return false;

      },
      child: Scaffold(
        
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text("HomePage"),
        //   actions: [
        //     IconButton(onPressed: (){
        //       locator.get<SharedPreferences>().clear();
        //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
        //     }, icon: Icon(Icons.logout)),
        //   ],
        // ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard,),label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.update,),label: "DailyUpdates"),
          BottomNavigationBarItem(icon: Icon(Icons.insights,),label: "Attendance"),
          BottomNavigationBarItem(icon: Icon(Icons.holiday_village,),label: "Leaves"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
    
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
    
        },),
      ),
    );
  }
}
