import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/app/routes.dart';
import 'package:testapp/features/dashboard/model/dashboard_card_model.dart';
import 'package:testapp/features/dashboard/services/dashboard_services.dart';
import 'package:testapp/features/dashboard/widgets/dashboard_card.dart';
import 'package:testapp/helpers/confirmation_dialog.dart';
import 'package:testapp/home.dart';
import 'package:testapp/injector.dart';
class DashboardView extends StatefulWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardCardModel? dashboardCard;
  bool _isloading = true;
  @override
  void initState(){
    super.initState();
    fetchDashboardCardData();
  }
  fetchDashboardCardData() async {
    DashboardCardModel? response = 
    await DashboardServices().fetchDashboardCardData();
    dashboardCard = response;
    _isloading = false;
    setState(() {
      
    });

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("DashboardView",style: TextStyle(fontSize: 20,color: Colors.red),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [

           IconButton(onPressed: () async{
             final bool isConfirmed = await getConfirmationDialog(context);
             if(isConfirmed){
               locator.get<SharedPreferences>().clear();
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute, (route) => false);
             
             }
           
              
           
          }, 
          icon: Icon(Icons.logout)),
         ],
      ),
      body: _isloading? Center(
        child: CircularProgressIndicator(color: Colors.redAccent,),
      ):Column(
        
        children: [
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left: 10),
          
          
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10,
            runSpacing: 10,
            children: [
             DashboardCard(icon: Icon(Icons.home), title: "My Missing CheckOut", count: dashboardCard!.myMissingCheckoutCount.toString(),containerColor: Colors.green,),


              DashboardCard(icon: Icon(Icons.timeline), title: "My Leave Balance", count: dashboardCard!.myLeaveBalance.toString(),containerColor: Colors.red,),

              DashboardCard(icon: Icon(Icons.settings), title: "My Ghost Count", count: dashboardCard!.myghostCount.toString(),containerColor: Colors.pink,),
              DashboardCard(icon: Icon(Icons.mail), title: "My No Updates", count: dashboardCard!.myNoDailyUpdate.toString(),containerColor: Colors.yellow,),
              DashboardCard(icon: Icon(Icons.settings), title: "My Not Acknowledge", count: dashboardCard!.myNotAcknowledged.toString(),),
              

              

              

              
            ],
          ),
          ),
          

        ],
      )
      
    );
  }
}