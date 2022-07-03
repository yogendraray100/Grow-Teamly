import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/constants/api_endpoints.dart';
import 'package:testapp/core/header.dart';
import 'package:testapp/helpers/snacks.dart';
import 'package:testapp/injector.dart';
import 'package:testapp/main.dart';

class NetworkClient {
Future<http.Response?> getRequest({String baseUrl = ApiEndpoints.baseUrl, required String path, }) async {
  http.Response? response;
   
   try{
     response = await http.get(Uri.parse(baseUrl + path), headers: getHeader());

   }catch(e){
    print(e.toString());

   }
   log(response != null ? response.statusCode.toString() : "response is null");
   return response;

}

Future<http.Response?> postRequest({String baseUrl = ApiEndpoints.baseUrl, required String path, Map<String, dynamic>? body}) async{
  http.Response? response;
  try{
    response = await http.post(Uri.parse(baseUrl + path),
    headers: getHeader(), body: body);
    if(response.statusCode == 200){
      locator.get<SharedPreferences>().setString(path, response.body);
    }

  }catch(e){
    final _cacheValue = locator<SharedPreferences>().getString(path);
    if(_cacheValue != null){
      response = http.Response(_cacheValue, 200);
    }
    AppSnacks.showSnackBar(AppSettings.navigatorKey.currentContext!,
    message: "Something went Wrong");
  }
     log(response != null ? response.statusCode.toString() : "response is null");

  return response;
}  

}