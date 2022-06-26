import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String count;
  const DashboardCard({ Key? key, required this.icon, required this.title, required this.count }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
                padding: EdgeInsets.all(10.0),
                height: 80,
                width: size.width * 0.45,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.blue,
                borderRadius: BorderRadius.circular(18),),
                child: Column(
                  
                  children: [
                    icon,
                    Text(title),
                    Text(count,style: TextStyle(fontSize: 15,color: Colors.white),),
                  ],
                )
              
              );
  }
}