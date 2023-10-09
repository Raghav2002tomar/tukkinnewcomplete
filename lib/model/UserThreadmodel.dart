class UserThreadModel {
  int? status;
  String? message;
  Data? data;
  String? error;

  UserThreadModel({this.status, this.message, this.data, this.error});

  UserThreadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  List<Threads>? threads;

  Data({this.threads});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['threads'] != null) {
      threads = <Threads>[];
      json['threads'].forEach((v) {
        threads!.add(new Threads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.threads != null) {
      data['threads'] = this.threads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Threads {
  int? id;
  String? userId;
  String? threadId;
  String? threadStatus;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  Threads(
      {this.id,
      this.userId,
      this.threadId,
      this.threadStatus,
      this.title,
      this.description,
      this.createdAt,
      this.updatedAt});

  Threads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    threadId = json['thread_id'];
    threadStatus = json['thread_status'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['thread_id'] = this.threadId;
    data['thread_status'] = this.threadStatus;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
