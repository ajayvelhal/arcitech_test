class TaskResponse {
  int? status;
  String? message;
  List<Data>? data;

  TaskResponse({this.status, this.message, this.data});

  TaskResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;
    data['created_at'] = createdAt;
    data['is_deleted'] = isDeleted;
    data['user'] = user;
    return data;
  }
}