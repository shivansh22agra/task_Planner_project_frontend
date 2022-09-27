import 'package:flutter/material.dart';
import 'package:task_planner_frontend/ApiService/HttpService.dart';
import 'package:task_planner_frontend/app/routes.dart';

class ApiService{

   Future getTaskDetails(BuildContext context) async {
    return await HttpService()
        .httpGet(
       
        AppRoutes.getRoute,
         context)
        .then((value) => value)
        .catchError((error) => error);
  }

}