import 'dart:convert';

import 'package:testapp/constants/api_endpoints.dart';
import 'package:testapp/core/network-client.dart';
import 'package:http/http.dart' ;
import 'package:testapp/features/dashboard/model/dashboard_card_model.dart';

class DashboardServices{
  //to fetch card data from dashboard 
 Future<DashboardCardModel?> fetchDashboardCardData() async{
  final Response? response = await NetworkClient().getRequest(path: ApiEndpoints.dashboardCardData);
    DashboardCardModel? dashboardCardModel;

    if(response != null && response.statusCode == 200){
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      dashboardCardModel = DashboardCardModel.fromJson(jsonResponse);

    }else{
      dashboardCardModel = null;

    }
    return dashboardCardModel;



  }
}