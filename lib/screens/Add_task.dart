import 'package:flutter/material.dart';

import '../app/colors.dart';
// import 'package:recipe_app/const.dart';
// import 'package:recipe_app/screens/Add_Recipe.dart';

class Add_Task extends StatelessWidget {
  static const id = "/Add_Task";
  const Add_Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController descriptionEditingController =
        TextEditingController();
    TextEditingController imageUrlEditingController = TextEditingController();
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
              controller: nameEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Task ID',
                  
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 1,
              controller: imageUrlEditingController,
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
          
        Add_Task_Button()
         

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
            onPressed: () {},
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
