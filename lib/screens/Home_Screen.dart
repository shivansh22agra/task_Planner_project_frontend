import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_planner_frontend/ApiService/ApiService.dart';
import 'package:http/http.dart' as http;
// import 'package:task_planner_frontend/ApiService/ApiService.dart';
// import 'package:task_planner_frontend/ApiService/Easy_api.dart';
// import 'package:task_planner_frontend/ApiService/HttpService.dart';
// import 'package:task_planner_frontend/ApiService/easyApiRepo.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  void fetchTaskDetails() async {
    // TasksApi tasksApi = TasksApi( TaskNetwork(baseApiUrl: 'http://localhost:7000'));
    // tasksApi.gettask().then((value) => print(value));

    //  http.Response response =
    //     await http.get(Uri.parse('http://192.168.1.3:3000/task/get'));
        //ye 192.168.1.3 ipv4 address hai
    //var data = jsonDecode(response.body);
    //print(data);
    ApiService apiService = ApiService();
    apiService.getTaskDetails(context).then((value) => {print(value)});
  }

  @override
  Widget build(BuildContext context) {
    //fetchTaskDetails();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchTaskDetails();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
