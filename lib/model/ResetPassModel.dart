/// status : 200
/// message : "global.Password_changed_successfully."
/// data : {"email":"sizhit@gmail.com","reset_token":"7477"}
/// error : ""

class ResetPassModel {
  ResetPassModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  ResetPassModel.fromJson(dynamic json) {
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
      String? email, 
      String? resetToken,}){
    _email = email;
    _resetToken = resetToken;
}

  Data.fromJson(dynamic json) {
    _email = json['email'];
    _resetToken = json['reset_token'];
  }
  String? _email;
  String? _resetToken;

  String? get email => _email;
  String? get resetToken => _resetToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['reset_token'] = _resetToken;
    return map;
  }

}