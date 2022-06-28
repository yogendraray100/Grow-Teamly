import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testapp/constants/api_endpoints.dart';
import 'package:testapp/core/network-client.dart';
import 'package:testapp/features/daily_updates/model/dailyupdate_model.dart';
class DailyUpdateServices{
 Future<List<DailuUpdateModel>> fetchDailyUpdates() async{
    final http.Response? response = await NetworkClient().getRequest(path: ApiEndpoints.fetchDailyUpdate); 
    List<DailuUpdateModel> dailyUpdates = [];
    if(response != null && response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((e){
        DailuUpdateModel dailyUpdate = DailuUpdateModel.fromJson(e);
        dailyUpdates.add(dailyUpdate);

      });
    }
    return dailyUpdates;

  }
}