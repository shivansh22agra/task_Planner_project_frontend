import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:task_planner_frontend/ApiClasses/taskClass.dart';
import 'package:task_planner_frontend/ApiService/ApiService.dart';
import 'package:http/http.dart' as http;

import '../app/colors.dart';
// import 'package:task_planner_frontend/ApiService/ApiService.dart';
// import 'package:task_planner_frontend/ApiService/Easy_api.dart';
// import 'package:task_planner_frontend/ApiService/HttpService.dart';
// import 'package:task_planner_frontend/ApiService/easyApiRepo.dart';

class Home_Screen extends StatefulWidget {
  static String id = "/Home_Screen";
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  ScrollController _scrollController = ScrollController();
  bool isShimmer = false;
  List<TaskGet> taskList = [];
  void fetchTaskDetails() async {
    // TasksApi tasksApi = TasksApi( TaskNetwork(baseApiUrl: 'http://localhost:7000'));
    // tasksApi.gettask().then((value) => print(value));

    //  http.Response response =
    //     await http.get(Uri.parse('http://192.168.1.3:3000/task/get'));
    //ye 192.168.1.3 ipv4 address hai
    //var data = jsonDecode(response.body);
    //print(data);
    ApiService apiService = ApiService();
    apiService.getTaskDetails(context).then((value) => {
          setState(() {
            isShimmer = false;
          }),
          print(value),
          if (value['status'] == true)
            {
              setState(() {
                isShimmer = true;
              }),
              value['data'].forEach((taskDetails) {
                TaskGet taskGet = TaskGet(
                  task_id: taskDetails['task_id'],
                  task_title: taskDetails['task_title'],
                  task_description: taskDetails['task_description'],
                );
                setState(() {
                  taskList.add(taskGet);
                });
              })
            }
          else
            {
              AlertDialog(
                content: Text("Error while fetching"),
              )
            }
        });
  }

  @override
  void initState() {
    fetchTaskDetails();
    // TODO: implement initState
    super.initState();
  }

  void _Scrolltotop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    //fetchTaskDetails();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: K.bgColorFaint,
        title: GestureDetector(
          onTap: () {
            _Scrolltotop();
          },
          child: Shimmer.fromColors(
            baseColor: K.whiteColor,
            highlightColor: K.violetColor,
            child: Text(
              "Task",
              style: GoogleFonts.poppins(
                  color: K.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: () async{
          setState(() {
            isShimmer = false;
            taskList.clear();
            fetchTaskDetails();
          });
        },
        child: ListView.builder(
            controller: _scrollController,
            itemCount: taskList.length,
            itemBuilder: (context, int index) {
              var details = taskList[index];
              return isShimmer
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: K.lightBlack,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(1),
                              bottomLeft: Radius.circular(1),
                              bottomRight: Radius.circular(20),
                            )),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Text(
                                    details.task_id.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: K.whiteColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Text(
                                    details.task_title!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: K.whiteColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Text(
                                    details.task_description!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: K.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : shimmerContainer(context);
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchTaskDetails();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

Widget shimmerContainer(context) {
  return Shimmer.fromColors(
      baseColor: K.lightBlack,
      highlightColor: K.violetColor,
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: K.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          )));
}
