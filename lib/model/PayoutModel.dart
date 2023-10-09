/// status : 200
/// message : "global.Payout_Inserted_Successfully"
/// data : {"payout":{"vendorid":178,"amount":"10","currency":"","payment_method":"","account_number":"","booking_Ids":"0","payout_status":"Pending","updated_at":"2023-09-22 12:09:25","created_at":"2023-09-22 12:09:25","id":17}}
/// error : ""

class PayoutModel {
  PayoutModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  PayoutModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
PayoutModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => PayoutModel(  status: status ?? _status,
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

/// payout : {"vendorid":178,"amount":"10","currency":"","payment_method":"","account_number":"","booking_Ids":"0","payout_status":"Pending","updated_at":"2023-09-22 12:09:25","created_at":"2023-09-22 12:09:25","id":17}

class Data {
  Data({
      Payout? payout,}){
    _payout = payout;
}

  Data.fromJson(dynamic json) {
    _payout = json['payout'] != null ? Payout.fromJson(json['payout']) : null;
  }
  Payout? _payout;
Data copyWith({  Payout? payout,
}) => Data(  payout: payout ?? _payout,
);
  Payout? get payout => _payout;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_payout != null) {
      map['payout'] = _payout?.toJson();
    }
    return map;
  }

}

/// vendorid : 178
/// amount : "10"
/// currency : ""
/// payment_method : ""
/// account_number : ""
/// booking_Ids : "0"
/// payout_status : "Pending"
/// updated_at : "2023-09-22 12:09:25"
/// created_at : "2023-09-22 12:09:25"
/// id : 17

class Payout {
  Payout({
      num? vendorid, 
      String? amount, 
      String? currency, 
      String? paymentMethod, 
      String? accountNumber, 
      String? bookingIds, 
      String? payoutStatus, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _vendorid = vendorid;
    _amount = amount;
    _currency = currency;
    _paymentMethod = paymentMethod;
    _accountNumber = accountNumber;
    _bookingIds = bookingIds;
    _payoutStatus = payoutStatus;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Payout.fromJson(dynamic json) {
    _vendorid = json['vendorid'];
    _amount = json['amount'];
    _currency = json['currency'];
    _paymentMethod = json['payment_method'];
    _accountNumber = json['account_number'];
    _bookingIds = json['booking_Ids'];
    _payoutStatus = json['payout_status'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  num? _vendorid;
  String? _amount;
  String? _currency;
  String? _paymentMethod;
  String? _accountNumber;
  String? _bookingIds;
  String? _payoutStatus;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
Payout copyWith({  num? vendorid,
  String? amount,
  String? currency,
  String? paymentMethod,
  String? accountNumber,
  String? bookingIds,
  String? payoutStatus,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => Payout(  vendorid: vendorid ?? _vendorid,
  amount: amount ?? _amount,
  currency: currency ?? _currency,
  paymentMethod: paymentMethod ?? _paymentMethod,
  accountNumber: accountNumber ?? _accountNumber,
  bookingIds: bookingIds ?? _bookingIds,
  payoutStatus: payoutStatus ?? _payoutStatus,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  num? get vendorid => _vendorid;
  String? get amount => _amount;
  String? get currency => _currency;
  String? get paymentMethod => _paymentMethod;
  String? get accountNumber => _accountNumber;
  String? get bookingIds => _bookingIds;
  String? get payoutStatus => _payoutStatus;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vendorid'] = _vendorid;
    map['amount'] = _amount;
    map['currency'] = _currency;
    map['payment_method'] = _paymentMethod;
    map['account_number'] = _accountNumber;
    map['booking_Ids'] = _bookingIds;
    map['payout_status'] = _payoutStatus;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}