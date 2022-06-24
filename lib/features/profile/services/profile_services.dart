import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testapp/constants/api_endpoints.dart';
import 'package:testapp/core/network-client.dart';
import 'package:testapp/features/profile/model/profile_model.dart';

class ProfileServices {

 Future<ProfileModel?> fetchProfile()async{
final response  = await NetworkClient().getRequest(path : ApiEndpoints.profile);
    
    ProfileModel? profile;
    if(response != null && response.statusCode == 200){

      Map<String, dynamic> json = jsonDecode(response.body);
      profile = ProfileModel.fromJson(json);
    }
    return profile;
    
  }

}