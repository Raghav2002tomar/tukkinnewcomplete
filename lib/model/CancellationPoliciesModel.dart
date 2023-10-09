
class CancellationPoliciesModel {
  CancellationPoliciesModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  CancellationPoliciesModel.fromJson(dynamic json) {
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
      List<CancellationPolicies>? cancellationPolicies,}){
    _cancellationPolicies = cancellationPolicies;
}

  Data.fromJson(dynamic json) {
    if (json['cancellation_policies'] != null) {
      _cancellationPolicies = [];
      json['cancellation_policies'].forEach((v) {
        _cancellationPolicies?.add(CancellationPolicies.fromJson(v));
      });
    }
  }
  List<CancellationPolicies>? _cancellationPolicies;
  List<CancellationPolicies>? get cancellationPolicies => _cancellationPolicies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cancellationPolicies != null) {
      map['cancellation_policies'] = _cancellationPolicies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CancellationPolicies {
  CancellationPolicies({
      num? id, 
      String? name, 
      String? description, 
      String? type, 
      String? value, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _description = description;
    _type = type;
    _value = value;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CancellationPolicies.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _type = json['type'];
    _value = json['value'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _type;
  String? _value;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get type => _type;
  String? get value => _value;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['type'] = _type;
    map['value'] = _value;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}