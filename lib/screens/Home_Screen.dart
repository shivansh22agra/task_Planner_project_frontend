import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:task_planner_frontend/ApiClasses/taskClass.dart';
import 'package:task_planner_frontend/ApiService/ApiService.dart';
import 'package:http/http.dart' as http;
import 'package:task_planner_frontend/screens/Add_task.dart';

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
  //  setState(() {
  //     isShimmer = false;
  //   });
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
        onRefresh: () async {
          setState(() {
            isShimmer = false;
            taskList.clear();
            fetchTaskDetails();
          });
        },
        child: ListView.builder(
            controller: _scrollController,
            itemCount: isShimmer?taskList.length:5,
            itemBuilder: (context, int index) {
             
              return isShimmer
                  ? ListContainer(context, index)
                  : shimmerContainer(context);
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Add_Task.id);

            //  fetchTaskDetails();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Padding ListContainer(BuildContext context, int index) {
     var details = taskList[index];
    return Padding(
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
                                  details.task_title??"title",
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
                                  details.task_description??"description",
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
                  );
  }
}

Widget shimmerContainer(context) {
  return Shimmer.fromColors(
      baseColor: K.lightBlack,
      highlightColor: K.violetColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(1),
                bottomLeft: Radius.circular(1),
                bottomRight: Radius.circular(20),
              ),
              color: K.whiteColor,
            ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20,
                        width: 90,
                        decoration: BoxDecoration(
                            color: K.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20,
                        width: 90,
                        decoration: BoxDecoration(
                            color: K.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20,
                        width: 90,
                        decoration: BoxDecoration(
                            color: K.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ));
}
