class DailuUpdateModel{
  int? id;
  int? userId;
  String? title;
  String? description;
  String? projectId;
  String? acknowledgedAt;

  DailuUpdateModel({this.id,this.userId,this.description,this.projectId,this.title,this.acknowledgedAt});

  DailuUpdateModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    projectId = json['project_id'];
    acknowledgedAt = json['acknowledge_at'];

  }
}