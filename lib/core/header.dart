import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/constants/app_constants.dart';
import 'package:testapp/injector.dart';

Map <String, String> getHeader(){
  Map<String, String> header = {"Accept" : "application/json"};

  String? token = locator<SharedPreferences>().getString(AppConstants.token);
  if(token !=null){
    Map<String, String> authorizationHeader = {"Authorization": "Bearer $token"};
    header.addAll(authorizationHeader);
  }
  return header;

}