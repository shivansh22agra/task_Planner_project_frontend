import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_planner_frontend/ApiClasses/taskClass.dart';
import 'package:task_planner_frontend/ApiService/HttpService.dart';
import 'package:task_planner_frontend/app/routes.dart';

class ApiService {
  Future getTaskDetails(BuildContext context) async {
    return await HttpService()
        .httpGet(AppRoutes.getRoute, context)
        .then((value) => value)
        .catchError((error) => error);
  }

  Future<TaskPostResponseModel> TaskPost(
      TaskGet requestModel, BuildContext context) async {
    print(requestModel.task_description);
    print(requestModel.task_title);
    print(requestModel.task_id);
    return await HttpService()
        .httpPost(
            jsonEncode(<String, dynamic>{
              "task_title": requestModel.task_title,
              "task_description": requestModel.task_description,
              "task_id": requestModel.task_id,
            }),
            AppRoutes.CreateTaskRoute,
            // Endpoint.USERBOOK,
            context)
        .then((value) {
      return TaskPostResponseModel.fromJson(value);
    }).catchError((err) {
      print(err);
    });
  }
}
