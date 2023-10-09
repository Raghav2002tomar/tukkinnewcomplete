
class StaticModel {
  StaticModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  StaticModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;

  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;
  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['error'] = _error;
    return map;
  }

}

class Data {
  Data({
      StaticPage? staticPage,}){
    _staticPage = staticPage;
}

  Data.fromJson(dynamic json) {
    _staticPage = json['StaticPage'] != null ? StaticPage.fromJson(json['StaticPage']) : null;
  }
  StaticPage? _staticPage;

  StaticPage? get staticPage => _staticPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_staticPage != null) {
      map['StaticPage'] = _staticPage?.toJson();
    }
    return map;
  }

}

class StaticPage {
  StaticPage({
      num? id, 
      String? name, 
      String? content, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _name = name;
    _content = content;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  StaticPage.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _content = json['content'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  String? _name;
  String? _content;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;

  num? get id => _id;
  String? get name => _name;
  String? get content => _content;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['content'] = _content;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}