import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testapp/constants/image_constants.dart';
import 'package:testapp/features/profile/model/profile_model.dart';
import 'package:testapp/features/profile/services/profile_services.dart';
import 'package:testapp/helpers/snacks.dart';
import 'package:testapp/models/dummypage_model.dart';

import '../../../app/routes.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
ProfileModel? profileModel;
bool _isloading = true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialFunction();
  }
  initialFunction() async{
    profileModel = await ProfileServices().fetchProfile();
    
      _isloading = false;
      setState(() {
        
      });
    

  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle : true,
        
      ),
    
    body: _isloading ? 
     CircularProgressIndicator() 
     :Center(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(height: 10,),
           ClipOval(child: Image.network(ImageConstants.bcc,fit: BoxFit.fitWidth,height: 80,),),
           SizedBox(height: 10,),
           Text(
             profileModel?.fullName ?? "",style: TextStyle(fontSize : 20,fontWeight: FontWeight.bold),
           ),
           SizedBox(height: 5,),
           Text(
             profileModel?.dateOfBirth ?? "" ,style: TextStyle(fontSize : 18,fontWeight: FontWeight.w400),
           ),
           Text("Supervisor: ${ profileModel?.supervisorName}"),

           ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, AppRoutes.dummyRoute, arguments: DummyPageModel(name: "Hello", address: "ktm", age: 20));
           }, child: Text("Navigate")),

           ElevatedButton(onPressed:(){
            AppSnacks.showErrorToast("Button Clicked", true);
           },child : const Text("Press")),

          
           
         ],
       ),
     ) 

      
    );
  }
}