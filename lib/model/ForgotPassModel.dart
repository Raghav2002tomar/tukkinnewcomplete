/// status : 200
/// message : "global.Password_reset_OTP"
/// data : {"reset_token":"4976"}
/// error : ""

class ForgotPassModel {
  ForgotPassModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  ForgotPassModel.fromJson(dynamic json) {
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
      String? resetToken,}){
    _resetToken = resetToken;
}

  Data.fromJson(dynamic json) {
    _resetToken = json['reset_token'];
  }
  String? _resetToken;
  
  String? get resetToken => _resetToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reset_token'] = _resetToken;
    return map;
  }

}