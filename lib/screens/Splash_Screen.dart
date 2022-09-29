import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_planner_frontend/app/colors.dart';
import 'package:task_planner_frontend/screens/Home_Screen.dart';
//import 'package:task_planner_frontend/app/fonts.dart';

class Splash_Screen extends StatefulWidget {
  static String id = "/Splash";
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, Home_Screen.id);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Task Planner🎯",
          style: TextStyle(
              color: K.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
