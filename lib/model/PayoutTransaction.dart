/// status : 200
/// message : "global.Result_found"
/// data : {"payout_transactions":[{"id":16,"vendorid":"178","amount":"20.00","currency":"","vendor_name":null,"payment_method":"","account_number":"","payout_status":"Pending","booking_Ids":"0","created_at":"2023-09-22 07:01:10","updated_at":"2023-09-22 07:01:10"},{"id":15,"vendorid":"178","amount":"20.00","currency":"","vendor_name":null,"payment_method":"","account_number":"","payout_status":"Pending","booking_Ids":"0","created_at":"2023-09-22 07:00:47","updated_at":"2023-09-22 07:00:47"},{"id":13,"vendorid":"178","amount":"100.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2222998","payout_status":"Pending","booking_Ids":null,"created_at":"2023-09-21 11:24:30","updated_at":"2023-09-21 11:24:30"},{"id":12,"vendorid":"178","amount":"300.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"5765835","payout_status":"Success","booking_Ids":null,"created_at":"2023-09-21 11:22:27","updated_at":"2023-09-21 11:22:27"},{"id":11,"vendorid":"178","amount":"300.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2222","payout_status":"Pending","booking_Ids":null,"created_at":"2023-09-21 10:53:56","updated_at":"2023-09-21 10:53:56"},{"id":10,"vendorid":"178","amount":"500.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2222","payout_status":"Pending","booking_Ids":null,"created_at":"2023-09-21 10:52:32","updated_at":"2023-09-21 10:52:32"},{"id":9,"vendorid":"178","amount":"298.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2354656547515","payout_status":"","booking_Ids":null,"created_at":"2023-09-21 10:21:38","updated_at":"2023-09-21 10:21:38"}],"offset":7}
/// error : ""

class PayoutTransaction {
  PayoutTransaction({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  PayoutTransaction.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
PayoutTransaction copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => PayoutTransaction(  status: status ?? _status,
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

/// payout_transactions : [{"id":16,"vendorid":"178","amount":"20.00","currency":"","vendor_name":null,"payment_method":"","account_number":"","payout_status":"Pending","booking_Ids":"0","created_at":"2023-09-22 07:01:10","updated_at":"2023-09-22 07:01:10"},{"id":15,"vendorid":"178","amount":"20.00","currency":"","vendor_name":null,"payment_method":"","account_number":"","payout_status":"Pending","booking_Ids":"0","created_at":"2023-09-22 07:00:47","updated_at":"2023-09-22 07:00:47"},{"id":13,"vendorid":"178","amount":"100.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2222998","payout_status":"Pending","booking_Ids":null,"created_at":"2023-09-21 11:24:30","updated_at":"2023-09-21 11:24:30"},{"id":12,"vendorid":"178","amount":"300.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"5765835","payout_status":"Success","booking_Ids":null,"created_at":"2023-09-21 11:22:27","updated_at":"2023-09-21 11:22:27"},{"id":11,"vendorid":"178","amount":"300.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2222","payout_status":"Pending","booking_Ids":null,"created_at":"2023-09-21 10:53:56","updated_at":"2023-09-21 10:53:56"},{"id":10,"vendorid":"178","amount":"500.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2222","payout_status":"Pending","booking_Ids":null,"created_at":"2023-09-21 10:52:32","updated_at":"2023-09-21 10:52:32"},{"id":9,"vendorid":"178","amount":"298.00","currency":null,"vendor_name":null,"payment_method":"strip","account_number":"2354656547515","payout_status":"","booking_Ids":null,"created_at":"2023-09-21 10:21:38","updated_at":"2023-09-21 10:21:38"}]
/// offset : 7

class Data {
  Data({
      List<PayoutTransactions>? payoutTransactions, 
      num? offset,}){
    _payoutTransactions = payoutTransactions;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['payout_transactions'] != null) {
      _payoutTransactions = [];
      json['payout_transactions'].forEach((v) {
        _payoutTransactions?.add(PayoutTransactions.fromJson(v));
      });
    }
    _offset = json['offset'];
  }
  List<PayoutTransactions>? _payoutTransactions;
  num? _offset;
Data copyWith({  List<PayoutTransactions>? payoutTransactions,
  num? offset,
}) => Data(  payoutTransactions: payoutTransactions ?? _payoutTransactions,
  offset: offset ?? _offset,
);
  List<PayoutTransactions>? get payoutTransactions => _payoutTransactions;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_payoutTransactions != null) {
      map['payout_transactions'] = _payoutTransactions?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    return map;
  }

}

/// id : 16
/// vendorid : "178"
/// amount : "20.00"
/// currency : ""
/// vendor_name : null
/// payment_method : ""
/// account_number : ""
/// payout_status : "Pending"
/// booking_Ids : "0"
/// created_at : "2023-09-22 07:01:10"
/// updated_at : "2023-09-22 07:01:10"

class PayoutTransactions {
  PayoutTransactions({
      num? id, 
      String? vendorid, 
      String? amount, 
      String? currency, 
      dynamic vendorName, 
      String? paymentMethod, 
      String? accountNumber, 
      String? payoutStatus, 
      String? bookingIds, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _vendorid = vendorid;
    _amount = amount;
    _currency = currency;
    _vendorName = vendorName;
    _paymentMethod = paymentMethod;
    _accountNumber = accountNumber;
    _payoutStatus = payoutStatus;
    _bookingIds = bookingIds;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PayoutTransactions.fromJson(dynamic json) {
    _id = json['id'];
    _vendorid = json['vendorid'];
    _amount = json['amount'];
    _currency = json['currency'];
    _vendorName = json['vendor_name'];
    _paymentMethod = json['payment_method'];
    _accountNumber = json['account_number'];
    _payoutStatus = json['payout_status'];
    _bookingIds = json['booking_Ids'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _vendorid;
  String? _amount;
  String? _currency;
  dynamic _vendorName;
  String? _paymentMethod;
  String? _accountNumber;
  String? _payoutStatus;
  String? _bookingIds;
  String? _createdAt;
  String? _updatedAt;
PayoutTransactions copyWith({  num? id,
  String? vendorid,
  String? amount,
  String? currency,
  dynamic vendorName,
  String? paymentMethod,
  String? accountNumber,
  String? payoutStatus,
  String? bookingIds,
  String? createdAt,
  String? updatedAt,
}) => PayoutTransactions(  id: id ?? _id,
  vendorid: vendorid ?? _vendorid,
  amount: amount ?? _amount,
  currency: currency ?? _currency,
  vendorName: vendorName ?? _vendorName,
  paymentMethod: paymentMethod ?? _paymentMethod,
  accountNumber: accountNumber ?? _accountNumber,
  payoutStatus: payoutStatus ?? _payoutStatus,
  bookingIds: bookingIds ?? _bookingIds,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get vendorid => _vendorid;
  String? get amount => _amount;
  String? get currency => _currency;
  dynamic get vendorName => _vendorName;
  String? get paymentMethod => _paymentMethod;
  String? get accountNumber => _accountNumber;
  String? get payoutStatus => _payoutStatus;
  String? get bookingIds => _bookingIds;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['vendorid'] = _vendorid;
    map['amount'] = _amount;
    map['currency'] = _currency;
    map['vendor_name'] = _vendorName;
    map['payment_method'] = _paymentMethod;
    map['account_number'] = _accountNumber;
    map['payout_status'] = _payoutStatus;
    map['booking_Ids'] = _bookingIds;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}