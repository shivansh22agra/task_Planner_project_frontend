import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static String BASE_URL = "http://192.168.1.3:3000";
   Future httpGet(
    //  Object requestModel, 
      String endpoint, BuildContext context) async {
   // var uuid = const Uuid();
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(Uri.parse(BASE_URL + endpoint),
    // headers: <String, String>{
     // 'Content-Type': 'application/json; charset=UTF-8',
     // 'x-auth-token': prefs.getString('AuthToken') ?? '',
     // 'x-request-token': uuid.v4(),
    //}
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      print("Session Expired");


    //  HelperFunctions().session_expired(context, "Session Expired");
    } else {
      return json.decode(response.body);
      throw Exception('Failed to load data!');
    }
  }

}
