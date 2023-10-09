/// status : 200
/// message : "global.Bank account updated successfully"
/// data : {"data":{"id":1,"user_id":"281","account_name":"SBI","bank_name":"qeweqw","branch_name":"asd","account_number":"d","iban":"asdas","swift_code":"asdas","created_at":"2023-09-27T12:06:47.000000Z","updated_at":"2023-09-27T12:56:24.000000Z"}}
/// error : ""

class InsertDataAccount {
  InsertDataAccount({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  InsertDataAccount.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
InsertDataAccount copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => InsertDataAccount(  status: status ?? _status,
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

/// data : {"id":1,"user_id":"281","account_name":"SBI","bank_name":"qeweqw","branch_name":"asd","account_number":"d","iban":"asdas","swift_code":"asdas","created_at":"2023-09-27T12:06:47.000000Z","updated_at":"2023-09-27T12:56:24.000000Z"}

class Data {
  Data({
    Data1? data,}){
    _data = data;
}

  Data.fromJson(dynamic json) {
    _data = json['data'] != null ? Data1.fromJson(json['data']) : null;
  }
  Data1? _data;

  Data1? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// user_id : "281"
/// account_name : "SBI"
/// bank_name : "qeweqw"
/// branch_name : "asd"
/// account_number : "d"
/// iban : "asdas"
/// swift_code : "asdas"
/// created_at : "2023-09-27T12:06:47.000000Z"
/// updated_at : "2023-09-27T12:56:24.000000Z"

class Data1 {
  Data1({
      num? id, 
      dynamic userId,
      String? accountName, 
      String? bankName, 
      String? branchName, 
      String? accountNumber, 
      String? iban, 
      String? swiftCode, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _accountName = accountName;
    _bankName = bankName;
    _branchName = branchName;
    _accountNumber = accountNumber;
    _iban = iban;
    _swiftCode = swiftCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data1.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _accountName = json['account_name'];
    _bankName = json['bank_name'];
    _branchName = json['branch_name'];
    _accountNumber = json['account_number'];
    _iban = json['iban'];
    _swiftCode = json['swift_code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _userId;
  String? _accountName;
  String? _bankName;
  String? _branchName;
  String? _accountNumber;
  String? _iban;
  String? _swiftCode;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  String? get userId => _userId;
  String? get accountName => _accountName;
  String? get bankName => _bankName;
  String? get branchName => _branchName;
  String? get accountNumber => _accountNumber;
  String? get iban => _iban;
  String? get swiftCode => _swiftCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['account_name'] = _accountName;
    map['bank_name'] = _bankName;
    map['branch_name'] = _branchName;
    map['account_number'] = _accountNumber;
    map['iban'] = _iban;
    map['swift_code'] = _swiftCode;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}