import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/app/routes.dart';
import 'package:testapp/helpers/confirmation_dialog.dart';
import 'package:testapp/home.dart';
import 'package:testapp/injector.dart';
class DashboardView extends StatefulWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [

           IconButton(onPressed: () async{
             final bool isConfirmed = await getConfirmationDialog(context);
             if(isConfirmed){
               locator.get<SharedPreferences>().clear();
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute, (route) => false);
             
             }
            //  showDialog(
            //    barrierDismissible: false,
            //    context: context, builder: (context){
            //    return AlertDialog(
                 
            //      title: Text("Do you want to log out ?"),
            //      content: Row(
            //        mainAxisAlignment: MainAxisAlignment.end,
            //        children: [
            //          TextButton(onPressed: (){
            //            Navigator.pop(context);
            //          }, child: Text ("No")),
            //          TextButton(onPressed: (){
            //            locator.get<SharedPreferences>().clear();
            //            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
            //          }, child: Text ("Yes")),
            //        ],
            //      ),
            //    );
            //  }
            // );
              
           
          }, 
          icon: Icon(Icons.logout)),
         ],
      ),
      
    );
  }
}