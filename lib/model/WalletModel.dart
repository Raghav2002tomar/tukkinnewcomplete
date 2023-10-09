/// status : 200
/// message : "global.password_updated_successfully"
/// data : {"wallet_balance":"0.00"}
/// error : ""

class WalletModel {
  WalletModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  WalletModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
WalletModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => WalletModel(  status: status ?? _status,
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

/// wallet_balance : "0.00"

class Data {
  Data({
    String? walletBalance,}){
    _walletBalance = walletBalance;
}

  Data.fromJson(dynamic json) {
    _walletBalance = json['wallet_balance'];
  }
  String? _walletBalance;
Data copyWith({  String? walletBalance,
}) => Data(  walletBalance: walletBalance ?? _walletBalance,
);
  String? get walletBalance => _walletBalance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wallet_balance'] = _walletBalance;
    return map;
  }

}