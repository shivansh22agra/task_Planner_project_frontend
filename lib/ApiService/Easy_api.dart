// import 'package:easy_api/easy_api.dart';
// import 'package:http/http.dart';
// import 'package:task_planner_frontend/app/routes.dart';

// class PostTask {
//   int? task_id;
//   String? task_description;
//   String? task_title;
//   PostTask({
//     this.task_id,
//     this.task_description,
//     this.task_title,
//   });
// }

// class TaskNetworks extends EasyApiHelper {
//   TaskNetworks({super.baseApiUrl = "http://localhost:7000"});

//   // Future UpdateTask(){

//   // }
//   Future DeleteTask(int id) async {
//     return await sendDeleteRequest(
//       route: AppRoutes.TaskDetailsRoute,
//       body: {"task_id": id},
//       isParams: false,
//     );
//   }

//   Future fetchtasks() async {
//     return await sendGetRequest(route: AppRoutes.getRoute);
//   }

//   Future createtask(PostTask postTask) async {
//     return sendPostRequest(
//       // url: '/task',
//       body: {
//         "task_id": postTask.task_id,
//         "task_title": postTask.task_title,
//         "task_description": postTask.task_description,
//         // "task_created_at": "2022-09-25T18:15:56.684Z",
//         // "task_scheduled_at": "stringcdcd",
//         //  "task_is_archived": false
//       },
//       route: AppRoutes.CreateTaskRoute,
//     );
//   }
// }
