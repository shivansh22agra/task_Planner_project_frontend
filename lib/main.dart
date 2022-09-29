// import 'package:easy_api/example/easy_api_example/lib/repository/todo.network.dart';
// import 'package:easy_api/example/easy_api_example/lib/repository/todo.repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:task_planner_frontend/ApiService/Easy_api.dart';
import 'package:task_planner_frontend/screens/Home_Screen.dart';
import 'package:task_planner_frontend/screens/Splash_Screen.dart';
//import 'package:task_planner_frontend/taskNotifer.dart';

void main() {
   //   DevicePreview(
        // enabled: !kReleaseMode,
        // builder: (context) => MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Device   useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: Preview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: Splash_Screen.id,
      routes: {
        Splash_Screen.id: (context) => const Splash_Screen(),
        Home_Screen.id: (context) => const Home_Screen(),
      },
      // home: const Home_Screen(),de
    );
  }
}
