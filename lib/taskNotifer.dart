// import 'package:awesome_widgets/awesome_widgets.dart';
// import 'package:easy_api/easy_api.dart';
// import 'package:easy_api/example/easy_api_example/lib/repository/todo.repository.dart';
// import 'package:flutter/material.dart';
// import 'package:task_planner_frontend/ApiService/Easy_api.dart';
// import 'package:task_planner_frontend/app/colors.dart';

// class TaskNotifier extends ChangeNotifier {
//   final TaskRepository taskRepository;
//   TaskNotifier({required this.taskRepository});
//   Future getTaskDetails(BuildContext context) async {
//     return await taskRepository.fetchTasks();
//   }

//   Future<bool> createTask(BuildContext context, PostTask postTask) async {
//     try {
//       Map result = await taskRepository.createTask(
//         taskTitle: postTask.task_title!,
//         taskDescription: postTask.task_description!,
//         taskCategoryIds: [], taskScheduledAt: '',
//         // : postTask.task_scheduled_at!,
//         //taskCategoryIds: postTask.task_category_ids!,
//       );
//       bool status = result['status'];
//       return true;
//     } on EasyException catch (e) {
//       AwesomeSnackbar.style1(
//           context: context,
//           primaryColor: KConstantColors.blueColor,
//           title: e.message,
//           backgroundColor: KConstantColors.bgColor);
//       return false;
//     }
//   }
// }
