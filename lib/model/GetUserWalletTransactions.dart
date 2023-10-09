/// status : 200
/// message : "global.Wallet_amount"
/// data : {"WalletTransactionsDetails":[{"id":18,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #50","status":"1","created_at":"2023-09-06T07:25:07.000000Z","updated_at":"2023-09-06T07:25:07.000000Z","currency":null},{"id":17,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #69","status":"1","created_at":"2023-09-06T06:41:50.000000Z","updated_at":"2023-09-06T06:41:50.000000Z","currency":null},{"id":16,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #49","status":"1","created_at":"2023-09-05T13:53:32.000000Z","updated_at":"2023-09-05T13:53:32.000000Z","currency":null},{"id":15,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #45","status":"1","created_at":"2023-09-05T13:49:58.000000Z","updated_at":"2023-09-05T13:49:58.000000Z","currency":null}],"offset":4}
/// error : ""

class GetUserWalletTransactions {
  GetUserWalletTransactions({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetUserWalletTransactions.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GetUserWalletTransactions copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GetUserWalletTransactions(  status: status ?? _status,
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

/// WalletTransactionsDetails : [{"id":18,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #50","status":"1","created_at":"2023-09-06T07:25:07.000000Z","updated_at":"2023-09-06T07:25:07.000000Z","currency":null},{"id":17,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #69","status":"1","created_at":"2023-09-06T06:41:50.000000Z","updated_at":"2023-09-06T06:41:50.000000Z","currency":null},{"id":16,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #49","status":"1","created_at":"2023-09-05T13:53:32.000000Z","updated_at":"2023-09-05T13:53:32.000000Z","currency":null},{"id":15,"user_id":"89","amount":"0.00","type":"credit","description":"Cancellation refund for booking #45","status":"1","created_at":"2023-09-05T13:49:58.000000Z","updated_at":"2023-09-05T13:49:58.000000Z","currency":null}]
/// offset : 4

class Data {
  Data({
      List<WalletTransactionsDetails>? walletTransactionsDetails, 
      num? offset,}){
    _walletTransactionsDetails = walletTransactionsDetails;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['WalletTransactionsDetails'] != null) {
      _walletTransactionsDetails = [];
      json['WalletTransactionsDetails'].forEach((v) {
        _walletTransactionsDetails?.add(WalletTransactionsDetails.fromJson(v));
      });
    }
    _offset = json['offset'];
  }
  List<WalletTransactionsDetails>? _walletTransactionsDetails;
  num? _offset;
Data copyWith({  List<WalletTransactionsDetails>? walletTransactionsDetails,
  num? offset,
}) => Data(  walletTransactionsDetails: walletTransactionsDetails ?? _walletTransactionsDetails,
  offset: offset ?? _offset,
);
  List<WalletTransactionsDetails>? get walletTransactionsDetails => _walletTransactionsDetails;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_walletTransactionsDetails != null) {
      map['WalletTransactionsDetails'] = _walletTransactionsDetails?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    return map;
  }

}

/// id : 18
/// user_id : "89"
/// amount : "0.00"
/// type : "credit"
/// description : "Cancellation refund for booking #50"
/// status : "1"
/// created_at : "2023-09-06T07:25:07.000000Z"
/// updated_at : "2023-09-06T07:25:07.000000Z"
/// currency : null

class WalletTransactionsDetails {
  WalletTransactionsDetails({
      num? id, 
      String? userId, 
      String? amount, 
      String? type, 
      String? description, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      dynamic currency,}){
    _id = id;
    _userId = userId;
    _amount = amount;
    _type = type;
    _description = description;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currency = currency;
}

  WalletTransactionsDetails.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _amount = json['amount'];
    _type = json['type'];
    _description = json['description'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _currency = json['currency'];
  }
  num? _id;
  String? _userId;
  String? _amount;
  String? _type;
  String? _description;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _currency;
WalletTransactionsDetails copyWith({  num? id,
  String? userId,
  String? amount,
  String? type,
  String? description,
  String? status,
  String? createdAt,
  String? updatedAt,
  dynamic currency,
}) => WalletTransactionsDetails(  id: id ?? _id,
  userId: userId ?? _userId,
  amount: amount ?? _amount,
  type: type ?? _type,
  description: description ?? _description,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  currency: currency ?? _currency,
);
  num? get id => _id;
  String? get userId => _userId;
  String? get amount => _amount;
  String? get type => _type;
  String? get description => _description;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['amount'] = _amount;
    map['type'] = _type;
    map['description'] = _description;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['currency'] = _currency;
    return map;
  }

}