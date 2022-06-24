import 'package:http/http.dart' as http;
import 'package:testapp/constants/api_endpoints.dart';
import 'package:testapp/core/header.dart';

class NetworkClient {
Future<http.Response?> getRequest({String baseUrl = ApiEndpoints.baseUrl, required String path, }) async {
  http.Response? response;
   
   try{
     response = await http.get(Uri.parse(baseUrl + path), headers: getHeader());

   }catch(e){
    print(e.toString());

   }
   return response;

}

Future<http.Response?> postRequest({String baseUrl = ApiEndpoints.baseUrl, required String path, Map<String, dynamic>? body}) async{
  http.Response? response;
  try{
    response = await http.post(Uri.parse(baseUrl + path),
    headers: getHeader(), body: body);

  }catch(e){
    print(e.toString());
  }
  return response;
}  

}