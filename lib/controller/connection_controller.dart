import 'package:bringin/controller/connection_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionController  extends ChangeNotifier {
final ConnectionHelper _helper = ConnectionHelper();
final String baseUrl = "https://bringin.io/api";

bool isLoading = false;


  getOTP(dynamic data) async {
    isLoading = true;
    notifyListeners();
try{
final response = await _helper.postData("$baseUrl/sendOTP", data);

if(response != null){
  if(response.statusCode == 200 || response.statusCode == 201){
    print(response.data);
    isLoading = false;
    notifyListeners();
    return true;

  }
  print(response.data);
   isLoading = false;
    notifyListeners();
    return false;
}
} catch (e){
print(e);
 isLoading = false;
    notifyListeners();
    return false;
}

  }
  
}


final connectionProvider = ChangeNotifierProvider<ConnectionController>((ref) {
  return ConnectionController();
});