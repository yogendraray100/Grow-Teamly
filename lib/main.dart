
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/app/route_handler.dart';
import 'package:testapp/app/routes.dart';
import 'package:testapp/constants/app_constants.dart';
import 'package:testapp/home.dart';
import 'package:testapp/homepage.dart';
import 'package:testapp/injector.dart';
import 'package:testapp/providers/auth_provider.dart';
import 'package:testapp/providers/counter_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  String? token = locator.get<SharedPreferences>().getString(AppConstants.token);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> CounterProvider()),
    ChangeNotifierProvider(create: (context)=> AuthProvider())
  ],
  child: TestApp(token: token,),
  ));
}

class TestApp extends StatelessWidget {
  final String? token;


   TestApp({ Key? key, this.token }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title :"Grow Teamly",
      navigatorKey: AppSettings.navigatorKey,
      onGenerateRoute: RouteHandler.generateRoute,
      //home : token != null ? HomePage() : LoginPage(),
      initialRoute: token != null ? AppRoutes.homeRoute : AppRoutes.loginRoute,
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class AppSettings{
  static GlobalKey<NavigatorState>navigatorKey = GlobalKey<NavigatorState>();
}