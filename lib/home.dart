


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/app/routes.dart';
import 'package:testapp/constants/app_constants.dart';
import 'package:testapp/constants/image_constants.dart';
import 'package:testapp/helpers/snacks.dart';
import 'package:testapp/homepage.dart';
import 'package:testapp/injector.dart';
import 'package:testapp/models/login_response_model.dart';
import 'package:testapp/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: loginformkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    ImageConstants.logo,
                    height: 150,
                    width: 150,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    validator: (String? value){
                      if(value == null || value.length < 10){
                        return "please enter valid phone number ";
                      }else {
                        return null;
                      }
                    
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                       borderRadius:BorderRadius.all(Radius.circular(15)), 
                      ),
                        hintText: "Phone Number",
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.phone)),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    validator: (value){
                      if(value == null || value.length < 8){
                        return "password must be gretaer or equal to eight characters";
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(15)),


                      ),
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
            
                      suffixIcon: GestureDetector(
                        child : Icon(Icons.visibility),
                        onLongPressStart:(val){
                          setState(() {
                            isObscure = false;
                          });
                        } ,
                        onLongPressEnd: (val){
                          setState(() {
                            isObscure = true;
                          });
                        },
                      ),
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       isObscure = !isObscure;
                      //     });
                      //   },
                      //   icon: Icon(
                      //     isObscure ? Icons.remove_red_eye : Icons.visibility_off,
                      //   ),
                      // ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        
                       if(loginformkey.currentState!.validate()){
                         setState(() {
                          isLoading = true;
                        });
                         AuthServices authServices = AuthServices();
                        LoginResponseModel? response = await authServices.login(_phoneController.text, _passwordController.text);
                         setState(() {
                         isLoading = false;
                       });
                       //check if response comes from server
                       if(response == null){
                         AppSnacks.showSnackBar(context, message: "No response from the server");
                       }else if(response.data != null){
                         locator.get<SharedPreferences>().setString(AppConstants.token, response.data!);
                         //ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Loggeed in ${response.data}"),duration: Duration(seconds: 10),));
                          AppSnacks.showSnackBar(context, message: "logged in");
                         //Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=> HomePage(),), (route) => false);
                         Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeRoute, (route) => false);

                       }else{
                        
                         //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter valid email password"),));
                         AppSnacks.showSnackBar(context, message: "Invalid");
                       }
                       }
                       
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ),
        ),
        if(isLoading)
        Center(
          child:CircularProgressIndicator(),
        )
        ],)
      ),
    );
  }
}
