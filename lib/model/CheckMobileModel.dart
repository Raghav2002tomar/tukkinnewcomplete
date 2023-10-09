/// status : 200
/// message : "global.mobile_availabel_move_OTP_screen"
/// data : {"phone":"9876543277","phone_country":"+91","otp":"8551"}
/// error : ""

class CheckMobileModel {
  CheckMobileModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  CheckMobileModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
CheckMobileModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => CheckMobileModel(  status: status ?? _status,
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

/// phone : "9876543277"
/// phone_country : "+91"
/// otp : "8551"

class Data {
  Data({
      String? phone, 
      String? phoneCountry, 
      String? otp,}){
    _phone = phone;
    _phoneCountry = phoneCountry;
    _otp = otp;
}

  Data.fromJson(dynamic json) {
    _phone = json['phone'];
    _phoneCountry = json['phone_country'];
    _otp = json['otp'];
  }
  String? _phone;
  String? _phoneCountry;
  String? _otp;
Data copyWith({  String? phone,
  String? phoneCountry,
  String? otp,
}) => Data(  phone: phone ?? _phone,
  phoneCountry: phoneCountry ?? _phoneCountry,
  otp: otp ?? _otp,
);
  String? get phone => _phone;
  String? get phoneCountry => _phoneCountry;
  String? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['phone_country'] = _phoneCountry;
    map['otp'] = _otp;
    return map;
  }

}