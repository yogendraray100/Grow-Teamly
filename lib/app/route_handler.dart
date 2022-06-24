

import 'package:flutter/material.dart';
import 'package:testapp/app/routes.dart';
import 'package:testapp/home.dart';
import 'package:testapp/homepage.dart';
import 'package:testapp/models/dummypage_model.dart';
import 'package:testapp/pages/dummy_page.dart';

class RouteHandler{
 static Route<dynamic> generateRoute(RouteSettings settings){
  var arguments = settings.arguments;
    switch(settings.name){
      case AppRoutes.loginRoute : return MaterialPageRoute(builder: (context)=>const LoginPage());
       case AppRoutes.homeRoute : return MaterialPageRoute(builder: (context)=>const HomePage());
       case AppRoutes.dummyRoute : return MaterialPageRoute(builder: (context)=>  DummyPage(
        data : arguments as DummyPageModel,
        
       ) );
            default: return MaterialPageRoute(builder: (context)=>const  LoginPage());
    }

  }
}