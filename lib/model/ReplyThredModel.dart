class ReplyThreadsModel {
  int? status;
  String? message;
  ReplyData? data;
  String? error;

  ReplyThreadsModel({this.status, this.message, this.data, this.error});

  ReplyThreadsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ReplyData.fromJson(json['data']) : null;
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

class ReplyData {
  List<ReplyThreadsData>? replyThreadsData;

  ReplyData({this.replyThreadsData});

  ReplyData.fromJson(Map<String, dynamic> json) {
    if (json['replyThreads'] != null) {
      replyThreadsData = <ReplyThreadsData>[];
      json['replyThreads'].forEach((v) {
        replyThreadsData!.add(new ReplyThreadsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.replyThreadsData != null) {
      data['replyThreads'] = this.replyThreadsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReplyThreadsData {
  int? id;
  String? threadId;
  String? userId;
  String? isAdminReply;
  String? message;
  String? createdAt;
  String? updatedAt;
  String? replyStatus;

  ReplyThreadsData(
      {this.id,
      this.threadId,
      this.userId,
      this.isAdminReply,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.replyStatus});

  ReplyThreadsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    threadId = json['thread_id'];
    userId = json['user_id'];
    isAdminReply = json['is_admin_reply'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    replyStatus = json['reply_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['thread_id'] = this.threadId;
    data['user_id'] = this.userId;
    data['is_admin_reply'] = this.isAdminReply;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['reply_status'] = this.replyStatus;
    return data;
  }
}
