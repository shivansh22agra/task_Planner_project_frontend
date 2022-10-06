class TaskGet {
  int? task_id;
  String? task_description;
  String? task_title;
  TaskGet({
    this.task_id,
    this.task_description,
    this.task_title,
  });
  //  "task_id": 23,
  //           "task_title": "pehtasktitle",
  //           "task_description": "pehla description",
}

class TaskPostResponseModel {
  bool? status;
   ///String? data;
  // String bookID;

  TaskPostResponseModel({this.status});

  factory TaskPostResponseModel.fromJson(json) {
    return TaskPostResponseModel(
       // data: json["message"] ?? '',
        status: json["status"] ?? '');
    //bookID: (json['book'] != null) ? json['book']['_id'] : '');
  }
}
