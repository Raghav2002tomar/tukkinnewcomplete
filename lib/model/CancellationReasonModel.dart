

class CancellationReasonModel {
  CancellationReasonModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  CancellationReasonModel.fromJson(dynamic json) {
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
      List<Reasons>? reasons,}){
    _reasons = reasons;
}

  Data.fromJson(dynamic json) {
    if (json['reasons'] != null) {
      _reasons = [];
      json['reasons'].forEach((v) {
        _reasons?.add(Reasons.fromJson(v));
      });
    }
  }
  List<Reasons>? _reasons;

  List<Reasons>? get reasons => _reasons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_reasons != null) {
      map['reasons'] = _reasons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Reasons {
  Reasons({
      num? orderCancellationId, 
      String? reason, 
      String? userType, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _orderCancellationId = orderCancellationId;
    _reason = reason;
    _userType = userType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Reasons.fromJson(dynamic json) {
    _orderCancellationId = json['order_cancellation_id'];
    _reason = json['reason'];
    _userType = json['user_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _orderCancellationId;
  String? _reason;
  String? _userType;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  num? get orderCancellationId => _orderCancellationId;
  String? get reason => _reason;
  String? get userType => _userType;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_cancellation_id'] = _orderCancellationId;
    map['reason'] = _reason;
    map['user_type'] = _userType;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}