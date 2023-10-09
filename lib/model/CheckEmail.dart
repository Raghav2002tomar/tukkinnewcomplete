/// status : 200
/// message : "global.email_available_move_OTP_screen"
/// data : {"email":"ullSANA@sfdsf.com","otp":"5793"}
/// error : ""

class CheckEmail {
  CheckEmail({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  CheckEmail.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
CheckEmail copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => CheckEmail(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  error: error ?? _error,
);
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

/// email : "ullSANA@sfdsf.com"
/// otp : "5793"

class Data {
  Data({
      String? email, 
      String? otp,}){
    _email = email;
    _otp = otp;
}

  Data.fromJson(dynamic json) {
    _email = json['email'];
    _otp = json['otp'];
  }
  String? _email;
  String? _otp;
Data copyWith({  String? email,
  String? otp,
}) => Data(  email: email ?? _email,
  otp: otp ?? _otp,
);
  String? get email => _email;
  String? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['otp'] = _otp;
    return map;
  }

}