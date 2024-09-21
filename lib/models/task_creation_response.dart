class TaskCreationResponse {
  int? status;
  String? message;
  Data? data;

  TaskCreationResponse({this.status, this.message, this.data});

  TaskCreationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  bool? completed;
  String? createdAt;
  bool? isDeleted;
  int? user;

  Data(
      {this.id,
        this.title,
        this.description,
        this.completed,
        this.createdAt,
        this.isDeleted,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    completed = json['completed'];
    createdAt = json['created_at'];
    isDeleted = json['is_deleted'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['completed'] = this.completed;
    data['created_at'] = this.createdAt;
    data['is_deleted'] = this.isDeleted;
    data['user'] = this.user;
    return data;
  }
}


