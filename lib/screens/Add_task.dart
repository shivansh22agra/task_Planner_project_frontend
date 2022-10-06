import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_planner_frontend/ApiClasses/taskClass.dart';
import 'package:task_planner_frontend/ApiService/ApiService.dart';

import '../app/colors.dart';
// import 'package:recipe_app/const.dart';
// import 'package:recipe_app/screens/Add_Recipe.dart';

class Add_Task extends StatefulWidget {
  static const id = "/Add_Task";
  const Add_Task({Key? key}) : super(key: key);

  @override
  State<Add_Task> createState() => _Add_TaskState();
}

class _Add_TaskState extends State<Add_Task> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController taskidEditingController = TextEditingController();
  // void postTask() {
  //   ApiService apiService = ApiService();
  //   apiService.TaskPost(task, context).then((value) {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.blue,
        // ),
        backgroundColor: K.bgColorFaint,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Center(
              child: Text(
            'Add Task',
            style: TextStyle(
                color: K.whiteColor, fontSize: 20, fontWeight: FontWeight.w700),
          )),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskidEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Task ID',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 1,
              controller: nameEditingController,
              decoration: const InputDecoration(
                  hintText: 'Task Title',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 5,
              controller: descriptionEditingController,
              decoration: const InputDecoration(
                  hintText: 'Task Description',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          Container(
            // width: double.infinity,
            child: Center(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: K.bgColor,
                      onPrimary: K.darkColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    TaskGet taskGet = TaskGet();

                    taskGet.task_description =
                        descriptionEditingController.text;
                    taskGet.task_title = nameEditingController.text;
                    taskGet.task_id = 100;
                    // taskidEditingController.text;
                    ApiService apiService = ApiService();
                    apiService.TaskPost(taskGet, context).then((value) {
                     // print(value);
                     // print(value.data);
                      print(value.status);
                      if (value.status == true) {
                        Fluttertoast.showToast(
                            msg: "Your book has been uploaded",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: K.violetColor,
                            textColor: K.whiteColor,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Your book has not been uploaded",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: K.violetColor,
                            textColor: K.whiteColor,
                            fontSize: 16.0);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Add Task",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class Add_Task_Button extends StatelessWidget {
  const Add_Task_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      child: Center(
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: K.bgColor,
                onPrimary: K.darkColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: () {
              TaskGet taskGet = TaskGet();
              taskGet.task_description = "descriptionEditingController.text";
              taskGet.task_title = "nameEditingController.text";
              taskGet.task_id = 100;
              ApiService apiService = ApiService();
              apiService.TaskPost(taskGet, context).then((value) {
                if (value.status == true) {
                  Fluttertoast.showToast(
                      msg: "Your book has been uploaded",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: K.violetColor,
                      textColor: K.whiteColor,
                      fontSize: 16.0);
                } else {
                  Fluttertoast.showToast(
                      msg: "Your book has not been uploaded",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: K.violetColor,
                      textColor: K.whiteColor,
                      fontSize: 16.0);
                }
              });
            },
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            label: Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
